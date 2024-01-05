import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopper/controllers/cart_controller.dart';
import 'package:getx_shopper/screens/cart_screen.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Catalog',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 28.0,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              iconSize: 28.0,
              onPressed: () => Get.to(() => const CartScreen()),
            ),
          ),
        ],
      ),
      body: const ShoppingList(),
    );
  }
}

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    const int itemCount = 10000; // Infinite scrolling

    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        // Shop item
        final shopItems = cartController.shopItems;
        // Cart item
        final cartItems = cartController.cartItems;

        // Colors for items
        List<Color> itemColors = cartController.rainbowColors;

        // Item list
        String item = shopItems[index % shopItems.length];
        Color itemColor = itemColors[index % itemColors.length];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Container(
              width: 50.0,
              height: 50.0,
              color: itemColor,
            ),
            title: Text(
              item,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            trailing: Obx(() => IconButton(
                  onPressed: cartItems.contains(item)
                      ? null
                      : () => cartController.addToCart(item),
                  icon: cartItems.contains(item)
                      ? const Icon(
                          Icons.check,
                          color: Colors.brown,
                        )
                      : const Text(
                          'ADD',
                          style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.normal),
                        ),
                )),
          ),
        );
      },
    );
  }
}
