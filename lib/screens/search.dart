import 'dart:async';
import 'package:cheesify/bloc/search/cheese_bloc.dart';
import 'package:cheesify/constants/colors.dart';
// import 'package:cheesify/cubit/cheese_cubit.dart';
import 'package:cheesify/view/search/init_view.dart';
import 'package:cheesify/widgets/cheese_details.dart';
import 'package:cheesify/widgets/search_cheese_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

//needed for hero to work with search field
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
  String query = "";

  TextEditingController _searchController = new TextEditingController();
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
                      controller: _searchController,
                      focusNode: focusNode,
                      placeholder: "Search cheese...",
                      onSubmitted: (val) {
                        submitCheeseName(context, val);
                      },
                      onSuffixTap: () {
                        submitClearSearch(context);
                        _searchController.clear();
                      },
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
              // child: buildInitialState(context),
              // child: BlocConsumer<CheeseCubit, CheeseState>( //cubit
              child: BlocConsumer<CheeseBloc, CheeseState>(
                //bloc
                listener: (context, state) {
                  if (state is CheeseError) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
                  } else if (state is CheeseLoaded) {
                    //do soemthing
                    _searchController.text = state.query;
                  }
                },
                builder: (context, CheeseState state) {
                  if (state is CheeseInitial) {
                    return buildInitialState(context);
                  } else if (state is CheeseLoading) {
                    return buildLoadingState();
                  } else if (state is CheeseLoaded) {
                    print("Cheese loaded!");
                    return buildLoadedState(state);
                  } else {
                    //todo: ERROR
                    return Container();
                  }
                },
              ),
            )
          ],
        )));
  }

  Container buildLoadingState() {
    return Container(
      width: Get.width,
      height: Get.height * .8,
      child: Center(
          child: CircularProgressIndicator(
        color: ThemeColors.primaryYellow,
      )),
    );
  }

  Widget buildLoadedState(CheeseLoaded state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Search results for ${state.query}"),
                  ),
                  Column(
                    children: state.cheese
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: CheeseSearchCard(cheese: e),
                            ))
                        .toList(),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  Widget buildInitialState(BuildContext context) {
    return SearchContent(
      callback: (String query) {
        submitCheeseName(context, query);
      },
    );
  }

  submitCheeseName(BuildContext context, String value) {
    // Cubit
    // final cheeseCubit = context.read<CheeseBloc>();
    // cheeseCubit.getCheese(value);

    // Bloc version
    final cheeseBloc = context.read<CheeseBloc>();
    cheeseBloc.add(GetCheese(value));
  }

  void submitClearSearch(BuildContext context) {
    //Cubit version
    // final cheeseCubit = context.read<CheeseCubit>();
    // cheeseCubit.clearQuery();

    final cheeseBloc = context.read<CheeseBloc>();
    cheeseBloc.add(ClearCheese());
  }
}
