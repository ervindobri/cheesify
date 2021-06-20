import 'package:cheesify/constants/colors.dart';
import 'package:cheesify/view/search/init_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef RemovedCallback(BuildContext context, String query);

class RecentSearchCheese extends StatefulWidget {
  const RecentSearchCheese({
    Key? key,
    required this.query,
    required this.callback,
    required this.removedCallback,
  }) : super(key: key);
  final String query;
  final SearchCallback callback;
  final RemovedCallback removedCallback;

  @override
  _RecentSearchCheeseState createState() => _RecentSearchCheeseState();
}

class _RecentSearchCheeseState extends State<RecentSearchCheese>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> size;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    final Animation<double> curve =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    size = Tween(begin: 1.0, end: 0.0).animate(curve);
    animationController.reverse();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        widget.callback(widget.query);
      },
      child: buildInitial(context),
    );
  }

  Widget buildInitial(BuildContext context) {
    print(size.value);
    return ScaleTransition(
      scale: Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
          parent: animationController, curve: Curves.easeInOut)),
      child: Container(
        width: (widget.query.length * 10 + 50),
        height: 40,
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
                  widget.query,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {
                  animationController.forward();
                  widget.removedCallback(context, widget.query);
                  //start animation to shrink
                },
                child: FaIcon(
                  FontAwesomeIcons.times,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
