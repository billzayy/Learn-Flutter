import 'package:flutter/material.dart';

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySnackBar(building: context),
    );
  }
}

class MySnackBar extends StatelessWidget {
  var building;
  MySnackBar({super.key, this.building});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar Demo"),
        leading: Builder(
          builder: (context) => IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(building);
                }),
        )
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Click the alarm button"),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(building);
            },
            child: const Text("Back to Home"),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.access_alarms),
        onPressed: () {
          const mySnackBar = SnackBar(
            content: Text('Wooo Bingo'),
            duration: Duration(milliseconds: 1000),
            backgroundColor: Colors.redAccent,
          );
          ScaffoldMessenger.of(context).showSnackBar((mySnackBar));
        },
      ),
    );
  }
}
