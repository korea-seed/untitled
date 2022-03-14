import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'grouplist.dart';
import 'count_controller.dart';
import 'imageviewpage.dart';
import 'imageslider.dart';
import 'introducepage.dart';
import 'businessarea.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Coporation World',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: SFWdemoState(title: 'Co'),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SFWdemoState(title: 'Co')),
        GetPage(name: '/second', page: () => GroupListPage()),
        GetPage(name: '/person', page: () => ImageViewPage()),
        GetPage(name: '/imageslider', page: () => ImageSlider()),
        GetPage(name: '/introduce', page: () => IntroducePage()),
        GetPage(name: '/business', page: () => BusinessArea()),
      ],
    );
  }
}


class SFWdemoState extends StatelessWidget {
  SFWdemoState({Key? key, required title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 싱글턴 테스트
    var controller = Singleton();

    print('sfwdemo build');

    var visible = 0.0.obs;

    var itga = controller.count;
    print('main controller.count = $itga');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cooperation World"),

        //  grouplist갔다가 돌아왔을때 왼쪽상단에 화살표 미표시하기위해
        leading: Builder(
          builder: (context) {
            return Container();
          },
        ),
        leadingWidth: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Obx() 함수 안쪽으로 처리할 이미지 위젯을 넣어서 refresh
              Obx(() {
                return InkWell(
                    child: AnimatedOpacity(
                        opacity: visible.value =
                            (visible.value == 0) ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 1000),
                        child: Image.asset("images/a-button.png"),
                        onEnd: () {
                          // 화면전환
                          Get.toNamed('/second', arguments: 100);
                          controller.count++;
                          var imsi = controller.count;
                          var tt = visible.value;
                          print('visible.value = $tt');
                          print('main1 controller.count = $imsi');
                        }),
                    onTap: () {
                      controller.count++;
                      var imsi = controller.count;
                      print('ontap = $imsi');
                      visible.value != visible.value;
                      visible.refresh();
                    }

//              onDoubleTap: () {
//                print(" on Double Tap ");
//              },
                    );
              }),
              InkWell(
                child: Image.asset("images/b-button.png"),
                onTap: () {
                  Get.toNamed('/imageslider');
                },
//            onDoubleTap: () {
//              print(" on Double Tap ");
//            },
              ),

              ElevatedButton(
                  onPressed: () => {
                    Get.toNamed('/introduce'),
                  },
                  child: const Text('소개동영상', style: TextStyle(fontSize: 15, color: Colors.redAccent),),
              ),

              ElevatedButton(
                  onPressed: () => {
                    Get.toNamed('/business'),
                  },
                  child: const Text('사업영역', style: TextStyle(fontSize: 15, color: Colors.redAccent),),
              ),

              Text(
                'count = ${controller.count}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
