import 'package:flutter/material.dart';

class GridViewDemo extends StatelessWidget {
  GridViewDemo({super.key});
  List arrColor= [
    Colors.red,
    Colors.blue,
    Colors.amber,
    Colors.green,
    Colors.purple,
    Colors.red,
    Colors.blue,
    Colors.amber,
    Colors.green,
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Grid View Demo"),
            ),
            body: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                // childAspectRatio: 5,
                mainAxisExtent: 250,
              ),
              scrollDirection: Axis.vertical,
              // physics: NeverScrollableScrollPhysics(),
              children: [
                for(int i = 0; i < arrColor.length; i++)
                  Container(color: arrColor[i])
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back)
            ),
          ),
        );
  }
}
