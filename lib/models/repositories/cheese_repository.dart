import 'dart:async';
import 'dart:math';
import 'package:cheesify/constants/data.dart';
import 'package:cheesify/models/cheese.dart';

abstract class CheeseRepository {
  ///Throws [Exception]
  Future<List<Cheese>> fetchCheese(String name);
  Future<List<String>> fetchRecentSearches();
}

class FakeCheeseRepository extends CheeseRepository {
  @override
  Future<List<Cheese>> fetchCheese(String name) {
    return Future.delayed(Duration(seconds: 1), () {
      // final random = Random();
      // if (random.nextBool()) {
      //   throw Exception();
      // }
      return DummyData.cheeses
          .where((element) =>
              element.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
      // return Cheese(name: 'Cheddar', attributes: [], cheeseClass: Class.FIRM);
    });
  }

  @override
  Future<List<String>> fetchRecentSearches() {
    return Future.delayed(Duration(milliseconds: 500), () {
      return DummyData.recentSearches;
    });
  }
}
