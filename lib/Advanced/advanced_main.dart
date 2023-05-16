import 'package:flutter/material.dart';

import 'provider_demo.dart';
import 'moveScreen.dart';
import 'consumer_demo.dart';
import 'multiProvider_demo.dart';
import 'getX_demo.dart'; // Tac dung giong Provider nma de hon

class AdvancedDemo extends StatelessWidget {
  AdvancedDemo({super.key});
  List<String> advanced = [
    "Provider",
    "Move Screen",
    "Consumer",
    "MultiProvider",
    "GetX",
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Demo Section',
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Demo Section',
              ),
            ),
            body: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                mainAxisExtent: 200,
              ),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                for (int i = 0; i < advanced.length; i++)
                  DemoSection(string: advanced[i])
              ],
            ),
          floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back)),
      )
    );
  }
}

class DemoSection extends StatelessWidget {
  final String string;
  const DemoSection({super.key, required this.string});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => chooseSection(string)));
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey,
          ),
          child: Text('$string Demo',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              )),
        ));
  }
}

Widget chooseSection(String string) {
  StatelessWidget result;
  switch (string) {
    case "Provider":
      result = const ProviderDemo();
      break;
    case "Move Screen":
      result = const MoveScreenDemo();
      break;
    case "Consumer":
      result = const ConsumerDemo();
      break;
    case "MultiProvider":
      result = const MultiProviderDemo();
      break;
    case "GetX":
      result = const GetXDemo();
      break;
    default:
      result = const Text("Hello World!");
      break;
  }
  return result;
}
