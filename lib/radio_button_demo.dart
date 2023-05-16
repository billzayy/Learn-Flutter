import 'package:flutter/material.dart';

class RadioButtonDemo extends StatefulWidget {
  const RadioButtonDemo({super.key});

  @override
  State<RadioButtonDemo> createState() => _RadioButtonDemoState();
}
class _RadioButtonDemoState extends State<RadioButtonDemo> {
  int _gender = 0;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title : const Text("Radio Button Demo")
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RadioListTile(
              title: const Text('LGBT'),
              subtitle: const Text('Gioi tinh thu 3'),
              secondary: const Icon(Icons.face),
              tileColor: Colors.white,
              contentPadding: const EdgeInsets.all(10),
              activeColor: Colors.purple,
              shape: Border.all(
                  width: 10,
                  color: Colors.amber,
                ),
              // selected: true,
              // selectedTileColor: Colors.redAccent,
              value: 3, 
              groupValue: _gender, 
              onChanged: (newValue) => setGender(newValue)
            ),
            ListTile(
              title: const Text('Male'),
              trailing: const Icon(Icons.male),
              leading: Radio(
                value : 0,
                groupValue: _gender,
                onChanged: (newValue){
                  setGender(newValue);
                }
              )
            ),
            ListTile(
              title: const Text('Female'),
              leading: Radio(
                value : 1,
                groupValue: _gender,
                onChanged: (newValue){
                  setGender(newValue);
                }
              )
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back)),
      )
    );
  }
  void setGender(Object? newValue) {
    setState(() {
      _gender = int.parse(newValue.toString());
    });
  }
}

