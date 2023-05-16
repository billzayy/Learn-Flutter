import 'package:flutter/material.dart';

class ScaffoldDemo extends StatelessWidget {
  const ScaffoldDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaffold Demo',
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: const Text('Scaffold Demo'),
            leading: Builder(
              builder: (context) => IconButton(
                  icon: const Icon(Icons.face),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  }),
            ),
            actions: [
              Builder(
                builder: (context) => IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    }),
              ),
            ]),
        drawer: Drawer(
            child: ElevatedButton(
                onPressed: () {
                  print("Clicked me !");
                },
                child: Container(child: const Text('Click Me')))),
        body: Container(
          color: Colors.greenAccent,
          child: const Center(
              child: Text("Hello",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ))),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.amberAccent,
          child: Container(
            height: 50,
          ),
        ),
      ),
    );
  }
}
