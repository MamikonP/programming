import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controllers/cart/cart_controller.dart';
import 'package:getx_test/controllers/cart/item_controller.dart';
import 'package:getx_test/models/item.dart';

class ItemView extends GetWidget<ItemController> {
  final cartController = Get.find<CartController>();
  ItemView({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.asset(
            item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Size: ${item.size}",
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
            Text(
              "Price: \$${item.price}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        trailing: Container(
          width: 80,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Get.isDarkMode ? Colors.grey[400] : Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    controller.decrement();
                    controller.quantity < 0
                        ? controller.reset()
                        : cartController.decrement();
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(color: Colors.orange, fontSize: 22),
                  )),
              Obx(
                () => Text(
                  "${controller.quantity.value}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    controller.increment();
                    cartController.increment();
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(color: Colors.orange, fontSize: 22),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
