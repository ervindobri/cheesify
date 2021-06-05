import 'package:cheesify/models/cheese.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DummyData {
  static List<dynamic> tabs = [
    [FontAwesomeIcons.cheese, "Firm"],
    [FontAwesomeIcons.fireAlt, "Spicy"],
    [FontAwesomeIcons.tint, "Creamy"]
  ];
  static List<Cheese> cheeses = [
    Cheese(
        name: 'Brie',
        shortDescription: "Sharp-tasting, natural cheese.",
        attributes: [Attributes.CREAMY],
        cheeseClass: Class.SOFT),
    Cheese(
        name: 'Camembert',
        attributes: [Attributes.CREAMY],
        cheeseClass: Class.SOFT),
    Cheese(
        name: 'Cheddar',
        shortDescription: "Sharp-tasting, natural cheese.",
        longDescription:
            "A relatively hard, off-white (or orange if colourings such as"
            "annatto are added), sometimes sharp-tasting, natural cheese.",
        fatScale: Scale.VERYHIGH,
        textureScale: Scale.VERYHIGH,
        agingScale: Scale.HIGH,
        proteinScale: Scale.VERYHIGH,
        attributes: [Attributes.FIRM, Attributes.SPICY],
        facts: [
          "Sharpness increases with age.",
          "Cloroing was originally added to distinguish where the Cheddar cheese was made."
        ],
        cheeseClass: Class.FIRM),
    Cheese(
        name: 'Cottage cheese',
        shortDescription: "Fresh cheese from the farm.",
        attributes: [],
        cheeseClass: Class.FRESH),
    Cheese(
        name: 'Emmental',
        shortDescription: "It has a savory but mild taste.",
        fatScale: Scale.VERYHIGH,
        textureScale: Scale.HIGH,
        agingScale: Scale.MID,
        attributes: [Attributes.FIRM],
        cheeseClass: Class.FIRM),
    Cheese(name: 'Feta', attributes: [], cheeseClass: Class.FRESH),
    Cheese(
        name: 'Gorgonzola',
        shortDescription: "Gorrrrrrr.",
        fatScale: Scale.VERYHIGH,
        textureScale: Scale.VERYHIGH,
        agingScale: Scale.HIGH,
        attributes: [Attributes.MOLDY, Attributes.FIRM],
        cheeseClass: Class.SEMIFIRM),
    Cheese(
        name: 'Neufchatel',
        shortDescription: "Gorrrrrrr.",
        attributes: [Attributes.CREAMY],
        cheeseClass: Class.SOFT),
    Cheese(
        name: 'Parmesan',
        shortDescription: "Gorrrrrrr.",
        attributes: [Attributes.FIRM],
        fatScale: Scale.VERYHIGH,
        textureScale: Scale.VERYHIGH,
        agingScale: Scale.HIGH,
        cheeseClass: Class.FIRM),
    Cheese(
        name: 'Quark',
        shortDescription: "Gorrrrrrr.",
        attributes: [Attributes.CREAMY],
        cheeseClass: Class.FRESH),
    Cheese(
        name: 'Raclette',
        shortDescription: "Gorrrrrrr.",
        attributes: [Attributes.SMOKED],
        cheeseClass: Class.FIRM),
    Cheese(
        name: 'Ricotta',
        shortDescription: "Gorrrrrrr.",
        attributes: [Attributes.CREAMY],
        cheeseClass: Class.SOFT),
    Cheese(
        name: 'Roquefort',
        attributes: [Attributes.MOLDY],
        cheeseClass: Class.SEMIFIRM),
    Cheese(
        name: 'Stilton',
        attributes: [Attributes.FIRM, Attributes.MOLDY],
        cheeseClass: Class.SEMIFIRM),
  ];

  static Map<String, dynamic> categories = {
    "Firm": cheeses
        .where((element) => element.attributes.contains(Attributes.FIRM))
        .toList(),
    "Spicy": cheeses
        .where((element) => element.attributes.contains(Attributes.SPICY))
        .toList(),
    "Creamy": cheeses
        .where((element) => element.attributes.contains(Attributes.CREAMY))
        .toList(),
  };
}
