import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/generated/assets.dart';
import '../utils/locationService.dart';
import '../models/property.dart';
import '../widgets/search_bar.dart';

class MapScreen extends StatefulWidget {
  final List<Property> properties;

  MapScreen(this.properties);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  LatLng? _currentPosition;
  BitmapDescriptor? _customIcon;

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
    _loadCustomMarker();
    _getLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);
  }

  String _mapStyle = '';

  Future<void> _loadMapStyle() async {
    _mapStyle = await DefaultAssetBundle.of(context).loadString('assets/map/black_map_style.json');
  }

  Future<void> _loadCustomMarker() async {
    final Uint8List markerIcon = await getBytesFromAsset('assets/map/marker_btn.png', 100);
    setState(() {
      _customIcon = BitmapDescriptor.fromBytes(markerIcon);
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  Future<void> _getLocation() async {
    var value = await LocationService().getCurrentLocation();
    if (value != null) {
      setState(() {
        _currentPosition = LatLng(value.latitude!, value.longitude!);
      });

      _generateNearbyPoints();
    }
  }


  List<LatLng> _nearbyPoints = [];


  void _generateNearbyPoints() {
    const double distance = 0.001; // 1 km radius

    List<Property> updatedProperties = List.generate(10, (index) {
      double offsetLat = _currentPosition!.latitude + (index % 2 == 0 ? distance : -distance);
      double offsetLng = _currentPosition!.longitude + (index % 2 == 0 ? distance : -distance);
      return Property(
        id: 'nearby_$index',
        title: 'Nearby Property $index',
        price: 0.0,
        latitude: offsetLat,
        longitude: offsetLng, description: '', imageUrl: '',
      );
    });

    setState(() {
      widget.properties.addAll(updatedProperties);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          _currentPosition != null && _customIcon != null
              ? GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _currentPosition!,
              zoom: 14.0,
            ),
            myLocationEnabled: false,
            buildingsEnabled: true,
            compassEnabled: false,
            liteModeEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            markers: widget.properties
                .map(
                  (property) => Marker(
                markerId: MarkerId(property.id),
                position: LatLng(property.latitude, property.longitude),
                infoWindow: InfoWindow(
                  title: property.title,
                  snippet: '\$${property.price}',
                ),
                icon: _customIcon!,
              ),
            )
                .toSet(),
          )
              : const Center(
            child: CircularProgressIndicator(),
          ),
          Positioned(
            top: 20,
            left: 0,
            child: SizedBox(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                        height: 39,
                        width: Get.width * 0.8 +5,
                        child: SearchBarWidget()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Image.asset(Assets.imagesOptions, height: 37, width: 37,),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
              bottom: 90,
              child: Column(children: [
                Image.asset(Assets.imagesNearbyIcon,width: 45,height: 45,),
                const SizedBox(height: 5,),
                Image.asset(Assets.imagesDirectionIcon,width: 45,height: 45,),

          ],),),
          Positioned(
            right: 25,
            bottom: 95,
            child: Container(
              height: 36,
              width: 115,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: const Color(0xff757575),
                  borderRadius: BorderRadius.circular(17)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(Assets.imagesMenu),
                  Text("List of variants",style: GoogleFonts.inter(fontSize:10,fontWeight:FontWeight.w500,color:const Color(0xffC8C8C8)),),
                ],
              ),
            )),
        ],
      ),
    );
  }
}
