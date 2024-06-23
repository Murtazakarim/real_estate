
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/appStyles/appStyles.dart';
import 'package:real_estate_app/generated/assets.dart';
import 'package:real_estate_app/screens/map_screen.dart';
import 'package:real_estate_app/screens/pages/homePage.dart';

import '../models/property.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Property> properties = [
    Property(
      id: '1',
      title: 'Luxury Villa',
      description: 'A beautiful villa in the heart of the city.',
      imageUrl: Assets.imagesBanner1,
      price: 1200000, latitude: 0.0, longitude: 0.000,
    ),
    Property(
      id: '2',
      title: 'Luxury Villa',
      description: 'A beautiful villa in the heart of the city.',
      imageUrl: Assets.imagesBanner1,
      price: 1200000, latitude: 0.0, longitude: 0.000,
    ),
    Property(
      id: '3',
      title: 'Luxury Villa',
      description: 'A beautiful villa in the heart of the city.',
      imageUrl: Assets.imagesBanner1,
      price: 1200000, latitude: 0.0, longitude: 0.000,
    ),
    Property(
      id: '4',
      title: 'Luxury Villa',
      description: 'A beautiful villa in the heart of the city.',
      imageUrl: Assets.imagesBanner1,
      price: 1200000, latitude: 0.0, longitude: 0.000,
    ),
    // Add more properties here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              pages(_selectedIndex),
              customBottomNavigation(),
            ],
          ),
        ),
      ),
    );
  }

  Widget pages(int index) {
    switch(index){
      case 0:
        return MapScreen( properties,);
      case 1:
        return Container();
      case 2:
        return const HomePage();
      case 3:
        return Container();
      case 4:
        return Container();
      default:
        return const HomePage();
    }
  }

  Widget bottomNavIcons({required String path,required int index,}) {
    bool selected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Container(
        width: selected ? 50:41,
        height: selected ? 55:41,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? AppStyles.primary:const Color(0xff232220),
        ),
        child: Center(
          child: Image.asset(path,color: Colors.white,width: 20,height: 20,),
        ),
      ),
    );
  }

  Widget customBottomNavigation(){
    return Positioned(
      left: 0,
      right: 0,
      bottom: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          width: Get.width,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xff2B2B2B).withOpacity(0.9),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bottomNavIcons(path: Assets.imagesSearchIcon,index: 0),
              bottomNavIcons(path: Assets.imagesChatIco,index: 1),
              bottomNavIcons(path: Assets.imagesHome,index: 2),
              bottomNavIcons(path: Assets.imagesHeart,index: 3),
              bottomNavIcons(path: Assets.imagesUser,index: 4),
            ],
          ),
        ),
      ),
    );
  }
}















