import 'dart:async';
import 'dart:math';
import 'package:cheesify/models/cheese.dart';

abstract class CheeseRepository {
  ///Throws [Exception]
  Future<Cheese> fetchCheese(String name);
}

class FakeCheeseRepository extends CheeseRepository {
  @override
  Future<Cheese> fetchCheese(String name) {
    return Future.delayed(Duration(seconds: 1), () {
      final random = Random();
      if (random.nextBool()) {
        throw Exception();
      }
      return Cheese(name: 'Cheddar', attributes: [], cheeseClass: Class.FIRM);
    });
  }
}
