enum Class { FRESH, SOFT, FIRM, SEMIFIRM, BLUE }
enum Attributes { FIRM, SPICY, CREAMY, MOLDY, SMOKED }

enum Scale { VERYLOW, LOW, MID, HIGH, VERYHIGH }

class Cheese {
  final String name;
  final String shortDescription;
  final String longDescription;
  final Class cheeseClass;
  final List<dynamic> attributes;
  final Scale fatScale;
  final Scale textureScale;
  final Scale agingScale;
  final Scale proteinScale;
  final bool favorite;
  final List<String> facts;

  Cheese(
      {required this.name,
      this.shortDescription = "",
      this.longDescription = "",
      this.fatScale = Scale.MID,
      this.textureScale = Scale.MID,
      this.agingScale = Scale.MID,
      this.proteinScale = Scale.MID,
      required this.cheeseClass,
      required this.attributes,
      this.favorite = false,
      this.facts = const []});
}
