import 'package:cheesify/bloc/recent_searches/recent_searches_bloc.dart';
import 'package:cheesify/constants/colors.dart';
import 'package:cheesify/constants/data.dart';
import 'package:cheesify/widgets/recent_search_cheese.dart';
import 'package:cheesify/widgets/search_cheese_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

typedef void SearchCallback(String query);

class SearchContent extends StatelessWidget {
  const SearchContent({
    Key? key,
    required this.callback,
  }) : super(key: key);
  final SearchCallback callback;

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
              child: BlocBuilder<RecentSearchesBloc, RecentSearchesState>(
                  builder: (BuildContext context, RecentSearchesState state) {
                if (state is RecentSearchesInitial) {
                  print("Initial!");
                  return buildInitial(context, DummyData.recentSearches);
                } else if (state is RecentSearchesLoading) {
                  print("Recent loading...");
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: ThemeColors.primaryYellow,
                      ),
                    ),
                  );
                } else if (state is RecentSearchesLoaded) {
                  print("Recent loaded!");
                  return buildInitial(context, state.recent);
                } else if (state is RecentSearchesEmpty) {
                  return buildEmpty();
                } else {
                  //
                  print(state);
                  return Container();
                }
              }),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
              child: Container(
                // color: Colors.black,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
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

  Container buildEmpty() {
    return Container(
      decoration: BoxDecoration(
          color: ThemeColors.primaryYellow.withOpacity(.1),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          "Suggested search: cheddar",
          style: TextStyle(color: ThemeColors.primaryYellow),
        ),
      ),
    );
  }

  Widget buildInitial(BuildContext context, List<String> data) {
    return Container(
      width: Get.width,
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
              children: data
                  .map((e) => RecentSearchCheese(
                      key: UniqueKey(),
                      query: e,
                      callback: callback,
                      removedCallback: removeRecentSearch))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  removeRecentSearch(BuildContext context, String query) {
    final recentBloc = context.read<RecentSearchesBloc>();
    recentBloc.add(RemoveRecentSearch(query));
  }

  addRecentSearch(BuildContext context, String query) {
    final recentBloc = context.read<RecentSearchesBloc>();
    recentBloc.add(AddRecentSearch(query));
  }
}
