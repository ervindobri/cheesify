import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cheesify/constants/data.dart';
import 'package:cheesify/models/cheese.dart';
import 'package:cheesify/widgets/cheese_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChipsFilter extends StatefulWidget {
  final List<dynamic> filters;
  final int selected;
  final Color selectedColor;
  final Color itemColor;

  ChipsFilter(
      {Key? key,
      required this.filters,
      required this.selected,
      required this.selectedColor,
      required this.itemColor})
      : super(key: key);

  @override
  _ChipsFilterState createState() => _ChipsFilterState();
}

class _ChipsFilterState extends State<ChipsFilter> {
  late int selectedIndex;

  @override
  void initState() {
    if (widget.selected != null &&
        widget.selected >= 0 &&
        widget.selected < widget.filters.length) {
      this.selectedIndex = widget.selected;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: Get.width,
          height: 70,
          child: ListView.builder(
            itemBuilder: this.chipBuilder,
            itemCount: widget.filters.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          ),
        ),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          reverseDuration: Duration(milliseconds: 250),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
                position: animation.drive(
                    Tween(begin: Offset(.66, 0.0), end: Offset(0.0, 0.0))),
                child: child);
          },
          child: getCurrentCarousel(),
        ),
      ],
    );
  }

  Widget chipBuilder(context, currentIndex) {
    dynamic filter = widget.filters[currentIndex];
    bool isActive = this.selectedIndex == currentIndex;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = currentIndex;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(right: 10),
          height: 50,
          decoration: BoxDecoration(
            color: isActive ? widget.selectedColor : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Icon(
                  filter[0],
                  color: isActive ? Colors.white : widget.selectedColor,
                ),
              ),
              Text(filter[1],
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: isActive ? Colors.white : widget.selectedColor)),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCurrentCarousel() {
    List<Cheese> items = DummyData.categories.values.toList()[selectedIndex];
    return Padding(
      key: ValueKey<int>(selectedIndex),
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        height: Get.height * .5,
        // color: Colors.black,
        width: Get.width,
        child: CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder: (context, index, child) =>
                CheeseCard(cheese: items[index]),
            options: CarouselOptions(
                viewportFraction: .7,
                enableInfiniteScroll: false,
                pageSnapping: true,
                // autoPlay: true,
                aspectRatio: 10 / 10)),
      ),
    );
  }
}
