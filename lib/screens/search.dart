import 'dart:async';

import 'package:cheesify/constants/colors.dart';
import 'package:cheesify/widgets/cheese_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget _flightShuttleBuilder(
  BuildContext flightContext,
  Animation<double> animation,
  HeroFlightDirection flightDirection,
  BuildContext fromHeroContext,
  BuildContext toHeroContext,
) {
  return DefaultTextStyle(
    style: DefaultTextStyle.of(toHeroContext).style,
    child: toHeroContext.widget,
  );
}

class SearchCheese extends StatefulWidget {
  const SearchCheese({Key? key}) : super(key: key);

  @override
  _SearchCheeseState createState() => _SearchCheeseState();
}

class _SearchCheeseState extends State<SearchCheese> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();

    Future.delayed(Duration(milliseconds: 500), () => focusNode.requestFocus());
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.bgGrey,
        body: SafeArea(
          child: Stack(
            children: [
              CustomBackButton(),
              Positioned(
                top: 20,
                left: 80,
                child: Hero(
                  tag: 'search',
                  flightShuttleBuilder: _flightShuttleBuilder,
                  child: Container(
                    width: Get.width * .7,
                    child: CupertinoSearchTextField(
                        focusNode: focusNode,
                        placeholder: "Search cheese...",
                        backgroundColor: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        padding: EdgeInsets.all(12),
                        style: TextStyle(
                            color: ThemeColors.primaryGrey, fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
