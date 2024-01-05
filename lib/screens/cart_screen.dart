import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopper/controllers/cart_controller.dart';
import 'package:getx_shopper/screens/shopping_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final cartItems = cartController.cartItems;
    final cost = cartController.cost;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.to(() => const ShoppingScreen()),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
      ),
      body: Container(
        color: Colors.yellow,
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemBuilder: (context, index) {
                    return cartItems.isNotEmpty
                        ? ListTile(
                            leading: const Icon(
                              Icons.check,
                              color: Colors.black,
                            ),
                            title: Text(
                              cartItems[index],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                cartController.removeFromCart(cartItems[index]);
                              },
                              icon: const Icon(Icons.remove_circle_outline),
                            ),
                          )
                        : Container();
                  },
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.black,
              ),
              Container(
                height: 150,
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\$$cost',
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      height: 33.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                        ),
                        onPressed: () {
                          const snackBar = SnackBar(
                              content: Text('Buying not supported yet.'));

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text(
                          'BUY',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
