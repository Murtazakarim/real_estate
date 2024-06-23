// lib/widgets/property_card.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/generated/assets.dart';
import '../models/property.dart';
import '../screens/property_detail_screen.dart';

class PropertyCard extends StatelessWidget {
  final Property property;

  const PropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image:  DecorationImage(
          image: AssetImage(property.imageUrl),
          fit: BoxFit.cover,
          alignment: Alignment.center
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: Get.width,
              height: 49,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(0xffCDB9A5).withOpacity(0.8),
              ),
              child: Stack(
                children: [
                  Center(child: Text("GladkovaSt.,25",style: GoogleFonts.inter(color: const Color(0xff4D4842),fontSize: 15,fontWeight: FontWeight.w500),)),
                  Positioned(
                      right: 0,
                      child: Container(width: 46,height: 46,decoration: const BoxDecoration(shape: BoxShape.circle,color: Color(0xffE7E2D8),),
                      child: const Icon(Icons.arrow_forward_ios_rounded,size: 10,),
                      ),)
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}
