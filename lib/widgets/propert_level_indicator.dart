import 'package:cheesify/canvas_helpers/circle_drawer.dart';
import 'package:cheesify/canvas_helpers/semicircle_drawer.dart';
import 'package:cheesify/constants/colors.dart';
import 'package:cheesify/models/cheese.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PropertyLevelIndicator extends StatelessWidget {
  final String propertyName;
  final Scale property;
  const PropertyLevelIndicator({
    Key? key,
    this.property = Scale.MID,
    required this.propertyName,
  }) : super(key: key);

  getIcon() {
    IconData icon;
    switch (this.propertyName) {
      case 'Fat':
        icon = FontAwesomeIcons.fire;
        break;
      case 'Texture':
        icon = Icons.texture;
        break;
      case 'Age':
        icon = FontAwesomeIcons.clock;
        break;
      case 'Protein':
        icon = FontAwesomeIcons.dna;
        break;
      default:
        return FontAwesomeIcons.cheese;
    }
    return icon;
  }

  getLevelIndicator() {
    double size = 5;
    List<Widget> items = [];
    for (var i = 0; i < 3; i++) {
      items.add(CustomPaint(
        size: Size(size, size),
        painter: CirclePainter(color: ThemeColors.primaryYellow),
      ));
    }
    // print("${this.propertyName} ${this.property}");
    switch (this.property) {
      case Scale.VERYLOW:
        items[2] = CustomPaint(
            size: Size(size, size),
            painter: SemiCirclePainter(color: ThemeColors.primaryYellow));
        items[1] = CustomPaint(
          size: Size(size, size),
          painter: CirclePainter(color: ThemeColors.primaryGrey),
        );
        items[0] = CustomPaint(
          size: Size(size, size),
          painter: CirclePainter(color: ThemeColors.primaryGrey),
        );
        break;
      case Scale.LOW:
        items[2] = CustomPaint(
            size: Size(size * 2, size * 2),
            painter: CirclePainter(color: ThemeColors.primaryGrey));
        items[1] = CustomPaint(
          size: Size(size, size),
          painter: CirclePainter(color: ThemeColors.primaryGrey),
        );
        items[0] = CustomPaint(
          size: Size(size, size),
          painter: CirclePainter(color: ThemeColors.primaryGrey),
        );
        break;
      case Scale.MID:
        items[0] = CustomPaint(
            size: Size(size, size),
            painter: SemiCirclePainter(color: ThemeColors.primaryYellow));
        items[1] = CustomPaint(
          size: Size(size, size),
          painter: CirclePainter(color: ThemeColors.primaryYellow),
        );
        items[2] = CustomPaint(
          size: Size(size, size),
          painter: CirclePainter(color: ThemeColors.primaryYellow),
        );
        break;
      case Scale.HIGH:
        items[0] = CustomPaint(
            size: Size(size, size),
            painter:
                CirclePainter(color: ThemeColors.primaryGrey.withOpacity(.4)));
        items[1] = CustomPaint(
          size: Size(size, size),
          painter: CirclePainter(color: ThemeColors.highColor),
        );
        items[2] = CustomPaint(
          size: Size(size, size),
          painter: CirclePainter(color: ThemeColors.highColor),
        );
        break;
      case Scale.VERYHIGH:
        items[0] = CustomPaint(
            size: Size(size, size),
            painter: CirclePainter(color: ThemeColors.veryHighColor));
        items[1] = CustomPaint(
          size: Size(size, size),
          painter: CirclePainter(color: ThemeColors.veryHighColor),
        );
        items[2] = CustomPaint(
          size: Size(size, size),
          painter: CirclePainter(color: ThemeColors.veryHighColor),
        );
        break;
      default:
        return [];
    }
    print(items.length);
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(this.propertyName),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: ThemeColors.primaryYellow,
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: FaIcon(
                getIcon(),
                color: ThemeColors.primaryYellow,
                size: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              height: 30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: getLevelIndicator(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
