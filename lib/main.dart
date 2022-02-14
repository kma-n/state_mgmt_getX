import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_practise/view/homepage.dart';
import 'package:getx_state_practise/view/list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Homepage()),
        GetPage(
            name: '/List', page: () => ListPage(), transition: Transition.zoom),
      ],
    );
  }
}
