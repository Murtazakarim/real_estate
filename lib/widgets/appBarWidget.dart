import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../appStyles/appStyles.dart';
import '../generated/assets.dart';
class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      width: double.infinity,
      child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 160,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(Assets.imagesLocationIcon),
                  Text("SaintPetersburg",style:GoogleFonts.inter().copyWith(color: AppStyles.lightOrange,fontSize: 11.5,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                ],
              ),
            ),
            Image.asset(Assets.imagesProfileIcon,height: 45,width: 45,fit: BoxFit.fill,),
          ]),
    );
  }
}
