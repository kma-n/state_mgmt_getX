import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_practise/controller/get_item_controller.dart';

class ListPage extends StatelessWidget {
  final ItemController itemsController = Get.put(ItemController());

  ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: itemsController.favList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              trailing: IconButton(
                  onPressed: () {
                    itemsController.delCart(itemsController.favList[index]);
                  },
                  icon: Icon(Icons.delete_forever)),
              title: Text(
                itemsController.favList[index],
              ),
            );
          },
        );
      }),
    );
  }
}
