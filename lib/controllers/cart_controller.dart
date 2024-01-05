import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final List<String> shopItems = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenburg',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];
  final List cartItems = [].obs;
  final List<Color> rainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
  final int price = 42;
  var cost = 0.obs;

  void addToCart(String item) {
    cartItems.add(item);
    cost += price;
  }

  void removeFromCart(String item) {
    cartItems.remove(item);
    cost -= price;
  }
}
