import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Button Demo"),
            ),
            body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    NormalButton(),
                    ElevatedButtonDemo(),
                    OutLineButtonDemo(),
                ]
              )
            ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)
            ),
          )
        );
  }
}

class NormalButton extends StatelessWidget {
  const NormalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom( // Style cach 2
        primary: Colors.amber,
        backgroundColor: Colors.lightBlue,

      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: const Text(
          "Click me",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}

class ElevatedButtonDemo extends StatelessWidget {
  const ElevatedButtonDemo({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => print("Clicked"),
      style:ButtonStyle( // => Style cach 1
        backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),

        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10)),

        elevation: MaterialStateProperty.all<double>(10),

        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(color: Colors.red)
          )
        )
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: const Icon(Icons.cloud, size: 40),
      ),
    );
  }
}

class OutLineButtonDemo extends StatelessWidget {
  const OutLineButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth:100,
        minHeight: 100,
        maxWidth: 200,
      ),
      child: OutlinedButton(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            "Click me",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        onPressed: () {},
      )
    );
  }
}