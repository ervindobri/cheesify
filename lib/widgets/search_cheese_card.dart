import 'package:auto_size_text/auto_size_text.dart';
import 'package:cheesify/constants/colors.dart';
import 'package:cheesify/models/cheese.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cheese_details.dart';

class CheeseSearchCard extends StatelessWidget {
  const CheeseSearchCard({
    Key? key,
    required this.cheese,
  }) : super(key: key);
  final Cheese cheese;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () => Get.to(() => CheeseDetails(cheese: cheese)),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/cheeses/" + cheese.name + '.png',
                  width: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cheese.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: ThemeColors.primaryGrey,
                        ),
                      ),
                      Container(
                        width: Get.width / 2,
                        child: AutoSizeText(
                          cheese.longDescription,
                          maxLines: 4,
                          maxFontSize: 13,
                          style: Get.textTheme.headline6,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
