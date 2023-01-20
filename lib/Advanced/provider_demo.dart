import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Provider
class CounterProvider extends ChangeNotifier {
  int _counter = 100;

  int get counter => _counter;

  void add() {
    _counter++;
    notifyListeners();
  }
}

// Provide Connector
class ProviderDemo extends StatelessWidget {
  const ProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CounterProvider(),
        child: MaterialApp(
          home: ProviderContent(building: context),
        )
      );
  }
}

//Client
class ProviderContent extends StatelessWidget {
  var building;
  ProviderContent({super.key, this.building});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: const Text("Provider Demo"),
          leading: Builder(
            builder: (context) => IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(building);
                }),
          )),
      body: Center(
          child: Text(
        context.watch<CounterProvider>().counter.toString(),
        style: const TextStyle(fontSize: 50),
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<CounterProvider>().add();
        },
      ),
    ));
  }
}
