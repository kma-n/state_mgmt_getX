import 'package:flutter/material.dart';
import 'package:getx_state_practise/controller/get_item_controller.dart';
import 'package:get/get.dart';
import 'package:getx_state_practise/services/api_service.dart';

class Homepage extends StatelessWidget {
  final ItemController itemController = Get.put(ItemController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Items List"),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Get.toNamed("/List");
              },
            )
          ],
        ),
        body: Obx(() {
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: itemController.itemList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                trailing: IconButton(
                    onPressed: () {
                      if (!itemController.favList
                          .contains(itemController.itemList[index].title)) {
                        itemController.addtoCart(
                            itemController.itemList[index].title.toString());
                      } else if (itemController.favList
                          .contains(itemController.itemList[index].title)) {
                        itemController.delCart(
                            itemController.itemList[index].title.toString());
                      }
                    },
                    icon: Icon(
                      Icons.check,
                      color: (itemController.favList
                              .contains(itemController.itemList[index].title))
                          ? Colors.green
                          : Colors.blueGrey,
                    )),
                title: Text(
                  itemController.itemList[index].title.toString(),
                ),
              );
            },
          );
        }));
  }
}
