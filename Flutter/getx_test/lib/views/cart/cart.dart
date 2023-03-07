import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controllers/cart/cart_controller.dart';
import 'package:getx_test/models/item.dart';
import 'package:getx_test/views/cart/widgets/item.dart';

class Cart extends GetView<CartController> {
  final items = Item.generateItems();
  Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text("My Cart"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ItemView(item: items[index]);
                    }),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Quantity",
                          style: TextStyle(fontSize: 18),
                        ),
                        Obx(
                          () => Text(
                            "${controller.total.value}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      ),
                      child: const Text("Buy Now"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
