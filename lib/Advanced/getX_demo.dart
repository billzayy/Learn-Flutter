import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXDemo extends StatelessWidget {
  const GetXDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Get X Demo", home: GetXContent(building: context));
  }
}

class GetXContent extends StatelessWidget {
  RxInt count = 0.obs;
  var building;
  GetXContent({super.key, this.building});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('Get X Demo'),
            leading: Builder(
              builder: (context) => IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(building);
                  }),
            ),
          ),
          body: Center(
              child: Text('$count',
                  style: const TextStyle(
                    fontSize: 50,
                  ))),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                count++;
                print(count);
              },
              child: const Icon(Icons.add)),
        ));
  }
}
