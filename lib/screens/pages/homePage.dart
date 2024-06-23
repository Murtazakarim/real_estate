import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../appStyles/appStyles.dart';
import '../../widgets/appBarWidget.dart';
import '../../widgets/customPathPainter/customshape.dart';
import '../../widgets/property_list.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            ClipPath(
              clipper:TCustomCurvedEdges(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6 + 20,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xffffffff),
                      Color(0xffFBD7A1)
                    ],
                  ),
                ),
                child:  Column(
                  children: [
                    const AppBarWidget(),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hi, Marina",style: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w400,color: AppStyles.darkGrey),textAlign: TextAlign.start,),
                              Text("let's select your\nperfect place",style: GoogleFonts.inter(fontSize: 33,fontWeight: FontWeight.w400,color: AppStyles.black),),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Container(
                          height: 177,
                          width: 177,
                          margin: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppStyles.primary,
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Center(child: Text("1034",style: GoogleFonts.inter(fontSize: 41,fontWeight: FontWeight.w400,color: Colors.white),textAlign: TextAlign.center,)),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 15,
                                child: Text("BUY",style: GoogleFonts.inter(fontSize: 12.5,fontWeight: FontWeight.w500,color: AppStyles.secondary),textAlign: TextAlign.center,),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 40,
                                child: Text("Offers",style: GoogleFonts.inter(fontSize: 11.5,fontWeight: FontWeight.w500,color: AppStyles.secondary),textAlign: TextAlign.center,),
                              ),


                            ],
                          ),
                        ),
                        Container(
                          height: 180,
                          width: 182,
                          margin: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppStyles.halfWhite,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 15,
                                child: Text("Rent",style: GoogleFonts.inter(fontSize: 12.5,fontWeight: FontWeight.w500,color: AppStyles.boxTextColor),textAlign: TextAlign.center,),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 40,
                                child: Text("Offers",style: GoogleFonts.inter(fontSize: 11.5,fontWeight: FontWeight.w500,color: AppStyles.boxTextColor),textAlign: TextAlign.center,),
                              ),
                              Center(child: Text("1034",style: GoogleFonts.inter(fontSize: 39,fontWeight: FontWeight.w400,color: AppStyles.lightGrey2),textAlign: TextAlign.center,)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: Get.height * 0.6,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: PropertyList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
