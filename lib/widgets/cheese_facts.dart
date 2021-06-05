import 'package:auto_size_text/auto_size_text.dart';
import 'package:cheesify/constants/colors.dart';
import 'package:cheesify/models/cheese.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CheeseFacts extends StatelessWidget {
  const CheeseFacts({Key? key, required this.cheese}) : super(key: key);
  final Cheese cheese;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cheese.name + " facts",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: ThemeColors.secondaryGrey),
        ),
        Column(
          children: cheese.facts
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: ThemeColors.lightYellow,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FaIcon(
                            Icons.info_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          Container(
                            width: Get.width * .7,
                            child: AutoSizeText(
                              e,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              maxFontSize: 17,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
