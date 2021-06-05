import 'package:auto_size_text/auto_size_text.dart';
import 'package:cheesify/constants/colors.dart';
import 'package:cheesify/models/cheese.dart';
import 'package:cheesify/widgets/propert_level_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/simple_animations.dart';

import 'cheese_facts.dart';
import 'cheese_nature_info.dart';

class CheeseDetails extends StatefulWidget {
  final Cheese cheese;

  const CheeseDetails({Key? key, required this.cheese}) : super(key: key);
  @override
  _CheeseDetailsState createState() => _CheeseDetailsState();
}

class _CheeseDetailsState extends State<CheeseDetails> with AnimationMixin {
  late Animation<double> animation;
  late AnimationController animController;
  @override
  void initState() {
    animController = AnimationController(
      duration: const Duration(milliseconds: 550),
      vsync: this,
    )..forward();
    animation = CurvedAnimation(
      parent: animController,
      curve: Curves.easeInCubic,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.bgGrey,
      child: Scaffold(
        backgroundColor: ThemeColors.bgGrey,
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Container(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: Get.height * .2,
                        // color: Colors.black,
                        child: Hero(
                          tag: widget.cheese.name + '-details',
                          child: Image.asset(
                            "assets/images/cheeses/" +
                                widget.cheese.name +
                                '.png',
                            width: Get.width * .5,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: Get.height * .7,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color:
                                    ThemeColors.primaryYellow.withOpacity(.15),
                                blurRadius: 50,
                                spreadRadius: -2,
                                offset: Offset(0, -50))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeTransition(
                                opacity: Tween<double>(
                                  begin: 0,
                                  end: 1,
                                ).animate(animation),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            widget.cheese.name,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 30,
                                                color:
                                                    ThemeColors.secondaryGrey),
                                          ),
                                          InkWell(
                                            child: Container(
                                              height: 44,
                                              width: 44,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: ThemeColors
                                                          .primaryYellow),
                                                  shape: BoxShape.circle),
                                              child: Center(
                                                child: FaIcon(
                                                  FontAwesomeIcons.heart,
                                                  color:
                                                      ThemeColors.primaryYellow,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          widget.cheese.longDescription,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 17,
                                              color: ThemeColors.secondaryGrey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              FadeTransition(
                                opacity: Tween<double>(
                                  begin: .2,
                                  end: 1,
                                ).animate(animation),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: NatureInfo(cheese: widget.cheese),
                                ),
                              ),
                              FadeTransition(
                                opacity: Tween<double>(
                                  begin: .2,
                                  end: 1,
                                ).animate(animation),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: CheeseFacts(cheese: widget.cheese),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                CustomBackButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: InkWell(
        highlightColor: Colors.transparent,
        onTap: () => Get.back(),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: ThemeColors.primaryYellow,
            ),
          ),
        ),
      ),
    );
  }
}
