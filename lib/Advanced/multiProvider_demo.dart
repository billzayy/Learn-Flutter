import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProviderDemo extends StatelessWidget {
  const MultiProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'MultiProviderDemo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness : context.watch<MySettings>().isDark
          ? Brightness.dark
          : Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: MultiContent(building: context)
    );
  }
}

class MultiContent extends StatelessWidget {
  var building;
  MultiContent({super.key, this.building});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Providers Demo"),
        leading: Builder(
          builder: (context) => IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(building);
                }),
        ),
        actions: [
          Switch(
            value: context.watch<MySettings>().isDark,
            onChanged: (newValue) {
              Provider.of<MySettings>(context, listen: false).setBrightness(newValue);
            }
          )
        ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times : '),
            Text(
              context.watch<Counter>().myValue.toString(),
              style: Theme.of(context).textTheme.headline4,
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<Counter>().add();
        },
        child: const Icon(Icons.add)
      ),
    );
  }
}


// 2 Providers
class MySettings extends ChangeNotifier {
  bool _isDark = false;
  
  get isDark => _isDark;

  void setBrightness(value){
    _isDark = value;
    notifyListeners();
  }
}

class Counter extends ChangeNotifier {
  int _myCounter = 0;
  get myValue => _myCounter;

  void add(){
    _myCounter++;
    notifyListeners();
  }
}
