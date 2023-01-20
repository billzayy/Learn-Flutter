import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'container_demo.dart';
import 'wrap_demo.dart';
import 'row_demo.dart';
import 'text_demo.dart';
import 'scaffold_demo.dart';
import 'button_demo.dart';
import 'radio_button_demo.dart';
import 'gridview_demo.dart';
import 'snackbar.dart';
import 'file_picker_demo.dart';
import 'video_player.dart';

import 'Advanced/advanced_main.dart';
import 'Advanced/multiProvider_demo.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MySettings()),
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  MyApp({super.key});
  List<String> basic = [
    "Container",
    "Row",
    "Scaffold",
    "Text",
    "Wrap",
    "Button",
    "Radio Button",
    "Grid View",
    "Snack Bar",
    "File Picker",
    "Video Picker",
    "Advanced"
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
                for (int i = 0; i < basic.length; i++)
                  DemoSection(string: '${basic[i]}')
              ],
            )));
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
            backgroundColor: const Color.fromRGBO(92, 51, 207, 1),
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
  var result;
  switch (string) {
    case "Container":
      result = ContainerDemo();
      break;
    case "Row":
      result = RowDemo();
      break;
    case "Scaffold":
      result = ScaffoldDemo();
      break;
    case "Text":
      result = TextDemo();
      break;
    case "Wrap":
      result = WrapDemo();
      break;
    case "Button":
      result = ButtonDemo();
      break;
    case "Radio Button":
      result = RadioButtonDemo();
      break;
    case "Grid View":
      result = GridViewDemo();
      break;
    case "Snack Bar":
      result = SnackBarDemo();
      break;
    case "File Picker":
      result = FilePickerDemo();
      break;
    case "Video Picker":
      result = VideoWidget(videoUrl: 'https://firebasestorage.googleapis.com/v0/b/chat-app2-e7dec.appspot.com/o/file%2FVID_20221019_084804.mp4?alt=media&token=7bcf8589-8eea-4ad9-ac22-54de3e641769',);
      break;
    case "Advanced":
      result = AdvancedDemo();
      break;
    default:
      result = Text("Hello World!");
      break;
  }
  return result;
}
