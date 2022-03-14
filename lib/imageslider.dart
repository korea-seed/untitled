import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageSlider extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5, 6, 7];
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImageSlider'),
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
            list.map( (item) => print("${item+1}") ).toList();
            return Container();
          },
        ),
        leadingWidth: 0,
      ),
      body: CarouselSlider(
        options: CarouselOptions(disableCenter: true),
        items: list
            .map(
              (item) => Center(child: Image.asset("images/${item - 1}.jpg")),
            )
            .toList(),
      ),
    );
  }
}
