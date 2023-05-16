import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {
  const WrapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Row Basic',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Row Basic Demo'),
            ),
            body: const Center(
              child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              children: <Widget>[
                RowBasic(),
                RowBasic(),
                RowBasic(),
                RowBasic(),
                RowBasic(),
                RowBasic(),
              ],
            ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)
          ),
      ),
    );
  }
}

class RowBasic extends StatefulWidget {
  const RowBasic({super.key});

  @override
  State<RowBasic> createState() => _RowBasicState();
}

class _RowBasicState extends State<RowBasic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      color: Colors.redAccent,
      margin: const EdgeInsets.all(4),
    );
  }
}
