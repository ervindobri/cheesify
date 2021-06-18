import 'package:cheesify/bloc/cheese_bloc.dart';
import 'package:cheesify/constants/colors.dart';
import 'package:cheesify/constants/data.dart';
import 'package:cheesify/cubit/cheese_cubit.dart';
import 'package:cheesify/models/repositories/cheese_repository.dart';
import 'package:cheesify/screens/search.dart';
import 'package:cheesify/widgets/chipsfilter.dart';
import 'package:cheesify/canvas_helpers/triangle_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  double triangle1Size = Get.height * .45;
  double triangle2Size = Get.height * .3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.bgGrey,
      appBar: AppBar(
        brightness: Brightness.light,
        toolbarHeight: 0,
        shadowColor: Colors.transparent,
        backgroundColor: ThemeColors.bgGrey,
      ),
      body: Container(
        height: Get.height,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: -100,
              child: CustomPaint(
                  size: Size(triangle1Size, triangle1Size),
                  painter: DrawTriangleShape(color: ThemeColors.lightYellow)),
            ),
            Positioned(
              bottom: 0,
              left: 100,
              child: CustomPaint(
                  size: Size(triangle2Size, triangle2Size),
                  painter:
                      DrawTriangleShape(color: ThemeColors.secondaryYellow)),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      width: 200,
                      child: Text("To cheese or not to cheese?",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              color: ThemeColors.secondaryGrey,
                              fontSize: 35,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 25),
                    child: InkWell(
                      onTap: () => Get.to(
                          () => bloc.BlocProvider(
                              create: (context) =>
                                  // CheeseCubit(FakeCheeseRepository()), //cubit
                                  CheeseBloc(FakeCheeseRepository()), //bloc
                              child: SearchCheese()),
                          transition: Transition.topLevel),
                      child: Hero(
                        tag: 'search',
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                // scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.search,
                                        color: ThemeColors.primaryGrey,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Search cheese...',
                                        style: TextStyle(
                                            color: ThemeColors.primaryGrey,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                  Container(
                      width: Get.width,
                      child: ChipsFilter(
                        selected: 0,
                        filters: DummyData.tabs,
                        selectedColor: ThemeColors.primaryYellow,
                        itemColor: Colors.white,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
