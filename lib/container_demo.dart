import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});
  final _name = "Bill";

  @override
  Widget build(BuildContext context) {
    const pi = 3.14;
    return MaterialApp(
      title: 'Startup Name Generator',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Startup Name Generator'),
            backgroundColor: Colors.redAccent,
          ),
          body: Container(
            width: 1000,
            height: 100,
            // color: Colors.greenAccent,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.greenAccent,
            ),
            transform: Matrix4.rotationZ(pi / 8),
            child: const Text("Hello World!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )
              ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back)
          ),
        ),
    );
  }
}
