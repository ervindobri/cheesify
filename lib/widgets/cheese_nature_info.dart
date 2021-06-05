import 'package:cheesify/constants/colors.dart';
import 'package:cheesify/models/cheese.dart';
import 'package:cheesify/widgets/propert_level_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cheese_facts.dart';

class NatureInfo extends StatelessWidget {
  final Cheese cheese;
  const NatureInfo({
    Key? key,
    required this.cheese,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nature info",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: ThemeColors.secondaryGrey),
        ),
        Container(
          height: 80,
          decoration: BoxDecoration(
              color: ThemeColors.bgGrey,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PropertyLevelIndicator(
                  propertyName: 'Fat', property: cheese.fatScale),
              PropertyLevelIndicator(
                  propertyName: 'Texture', property: cheese.textureScale),
              PropertyLevelIndicator(
                  propertyName: 'Age', property: cheese.agingScale),
              PropertyLevelIndicator(
                  propertyName: 'Protein', property: cheese.proteinScale),
            ],
          ),
        )
      ],
    );
  }
}
