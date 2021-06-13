import 'package:cheesify/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecentSearchCheese extends StatelessWidget {
  const RecentSearchCheese({
    Key? key,
    required this.query,
  }) : super(key: key);
  final String query;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        //todo: search with this query
        print("Searching $query");
      },
      child: Container(
        width: query.length * 10 + 50,
        decoration: BoxDecoration(
            color: ThemeColors.primaryYellow,
            borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Text(
                  query,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.times,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
