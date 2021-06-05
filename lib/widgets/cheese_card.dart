import 'dart:ui';
import 'package:cheesify/constants/colors.dart';
import 'package:cheesify/models/cheese.dart';
import 'package:cheesify/widgets/propert_level_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cheese_details.dart';

class CheeseCard extends StatelessWidget {
  final Cheese cheese;
  const CheeseCard({
    Key? key,
    required this.cheese,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => Get.to(() => CheeseDetails(cheese: cheese),
          transition: Transition.topLevel,
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 200)),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: Get.width * .65,
                height: Get.height * .37,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.4),
                    borderRadius: BorderRadius.circular(25)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cheese.name,
                            style: GoogleFonts.poppins(
                                color: ThemeColors.primaryGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 20)),
                        Text(cheese.shortDescription,
                            style: GoogleFonts.poppins(
                                color: ThemeColors.primaryGrey,
                                fontWeight: FontWeight.w300,
                                fontSize: 16)),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PropertyLevelIndicator(
                                  propertyName: 'Fat',
                                  property: cheese.fatScale),
                              PropertyLevelIndicator(
                                  propertyName: 'Texture',
                                  property: cheese.textureScale),
                              PropertyLevelIndicator(
                                  propertyName: 'Age',
                                  property: cheese.agingScale),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Hero(
              tag: cheese.name + '-details',
              child: Image.asset(
                "assets/images/cheeses/" + cheese.name + '.png',
                width: Get.width * .5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
