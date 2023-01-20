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
class MoveScreenDemo extends StatelessWidget {
  const MoveScreenDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CounterProvider(),
        child: MaterialApp(
          home: HomeScreen(building: context),
        ));
  }
}

//Client
class HomeScreen extends StatelessWidget {
  var building;
  HomeScreen({super.key, this.building});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Home Screen"),
          leading: Builder(
            builder: (context) => IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(building);
                }),
          )),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.watch<CounterProvider>().counter.toString(),
              style: TextStyle(
                fontSize: 50,
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SecondScreen()));
              },
              child: Text("Go to Second Screen"))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<CounterProvider>().add();
        },
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.watch<CounterProvider>().counter.toString(),
              style: TextStyle(
                fontSize: 50,
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go to Home Screen"))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<CounterProvider>().add();
        },
      ),
    );
  }
}
