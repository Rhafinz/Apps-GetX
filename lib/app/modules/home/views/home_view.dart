import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:myapp/app/modules/counter/views/counter_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Get.toNamed('/counter');
          //   },
          //   child: Text("Pindah Ke Halaman Counter"),
          // ),
          // SizedBox(height: 10),
          // ElevatedButton(
          //   onPressed: () {
          //     Get.toNamed('/biodata');
          //   },
          //   child: Text("Pindah Ke Halaman Biodata"),
          // ),
          // SizedBox(height: 10),
          // ElevatedButton(
          //   onPressed: () {
          //     Get.toNamed('/profile');
          //   },
          //   child: Text("Profile"),
          // )
        ],
      ),
    );
  }
}
