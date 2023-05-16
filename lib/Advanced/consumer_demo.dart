import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySettings extends ChangeNotifier {
  String text = "Bill";
  Color color = Colors.red;

  void changeText(){
    if(text == 'Hello'){
      text = 'World';
    }
    else{
      text = "Hello";
    }
    notifyListeners();
  }

  void changeColor(){
    if(color == Colors.red){
      color = Colors.amberAccent;
    }
    else{
      color = Colors.red;
    }
    notifyListeners();
  }
}

// Provide Connector
class ConsumerDemo extends StatelessWidget {
  const ConsumerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => MySettings(),
        child: MaterialApp(
          home: ConsumerContent(building: context),
        )
      );
  }
}

// ignore: must_be_immutable
class ConsumerContent extends StatelessWidget {
  var building;
  ConsumerContent({super.key, this.building});

  @override
  Widget build(BuildContext context) {
    return Consumer<MySettings>(
      builder: (context, varSetting, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Consumer Demo"),
            backgroundColor: varSetting.color,
            actions: [
              Builder(
                builder: (context) => IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(building);
                    }),
                ),
            ]
          ),
          drawer: Drawer(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    varSetting.changeText();
                    Navigator.pop(context);
                  },
                  child: const Text("Change Text"),
                ),
                ElevatedButton(
                  onPressed: () {
                    varSetting.changeColor();
                    Navigator.pop(context);
                  },
                  child: const Text("Change Color"),
                ),
              ],
            )
          ),
        ),
          body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(varSetting.text),
              ElevatedButton(
                onPressed: () {
                  varSetting.changeText();
                },
                child: const Text("Change Text"),
              ),
            ],
          )
        ),
        );
      }
    );
  }
}
