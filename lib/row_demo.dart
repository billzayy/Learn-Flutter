import 'package:flutter/material.dart';
import 'wrap_demo.dart';

class RowDemo extends StatefulWidget {
  const RowDemo({super.key});

  @override
  State<RowDemo> createState() => _RowDemoState();
}

class _RowDemoState extends State<RowDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Row Demo'),
          backgroundColor: Colors.amberAccent,
        ),
        body: const Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RowBasic(),
                Expanded(flex: 3, child: RowBasic()), // Kéo dãn Widget
                Expanded(flex: 2, child: RowBasic()),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
      ),
    );
  }
}