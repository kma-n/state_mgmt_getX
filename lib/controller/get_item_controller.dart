import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_practise/models/item_model.dart';
import 'package:getx_state_practise/services/api_service.dart';

class ItemController extends GetxController {
  var isLoading = true.obs;
  var itemList = <Items>[].obs;
  var favList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchList();
    super.onInit();
  }

  Future fetchList() async {
    try {
      isLoading(true);
      var items = await ApiService().fetchList();
      if (items != null) {
        itemList.value = items;
      }
    } finally {
      isLoading(false);
    }
  }

  void addtoCart(String item) {
    favList.add(item);
  }

  void delCart(String item) {
    favList.remove(item);
  }
}
