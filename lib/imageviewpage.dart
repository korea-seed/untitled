import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageViewPage extends StatelessWidget {
  @override

  int per = Get.arguments;

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('직원소개'),
      ),

      body: Center(
        child: Image.asset("images/$per.jpg"),
      ),
    );
  }
}