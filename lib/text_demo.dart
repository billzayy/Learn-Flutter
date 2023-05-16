
import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Text Demo",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Text Demo"),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello World!" * 3,
                  softWrap: true,
                  // textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    wordSpacing: 10,
                    letterSpacing: 10,
                    backgroundColor: Colors.amber,
                    decorationColor: Colors.blue,
                    height: 4,
                    leadingDistribution: TextLeadingDistribution.even,
                  )),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    "TextField Demo",
                    style : TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                   )
                  ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: const TextField(
                  // controller:
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Input somethings here'),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false, // => Secure your password
                  enableSuggestions: false,
                  autocorrect: false,
                ),
              )
            ],
          )),
          floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back)),
        ));
  }
}
