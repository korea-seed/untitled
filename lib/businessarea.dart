import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessArea extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BusinessArea'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'before page',
            onPressed: () {
              //  이전화면으로 돌아간다
              Get.toNamed('/');
            },
          ),
        ],
        leading: Builder(
          builder: (context) {
            return Container();
          },
        ),
        leadingWidth: 0,
      ),

      body: Container(
          child: Chip(
            labelPadding: const EdgeInsets.all(2.0),
            avatar: const CircleAvatar(
              backgroundColor: Colors.white70,
              child: Text('T'),
            ),
            label: const Text(
              'TestPage',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.redAccent,
            elevation: 6.0,
            shadowColor: Colors.grey[60],
            padding: const EdgeInsets.all(8.0),
          ),
      ),
    );
  }
}