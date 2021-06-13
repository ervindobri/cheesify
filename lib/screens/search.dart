import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cheesify/constants/colors.dart';
import 'package:cheesify/constants/data.dart';
import 'package:cheesify/models/cheese.dart';
import 'package:cheesify/widgets/cheese_details.dart';
import 'package:cheesify/widgets/recent_search_cheese.dart';
import 'package:cheesify/widgets/search_cheese_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              Positioned(
                top: 80,
                child: SearchContent(),
              )
            ],
          ),
        ));
  }
}

class SearchContent extends StatelessWidget {
  const SearchContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
              child: Container(
                // color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recent searches"),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Wrap(
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 5.0, // gap between lines
                        alignment: WrapAlignment.spaceEvenly,
                        children: DummyData.recentSearches
                            .map((e) => RecentSearchCheese(query: e))
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
              child: Container(
                // color: Colors.black,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Popular cheeses"),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Wrap(
                          direction: Axis.vertical,
                          spacing: 12,
                          children: DummyData.popularCheeses
                              .map((e) => CheeseSearchCard(cheese: e))
                              .toList(),
                        ),
                      ),
                      Container(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
