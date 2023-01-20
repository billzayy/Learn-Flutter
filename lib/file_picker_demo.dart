// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FilePickerDemo extends StatefulWidget {
  const FilePickerDemo({Key? key}) : super(key: key);

  @override
  State<FilePickerDemo> createState() => _FilePickerDemo();
}

class _FilePickerDemo extends State<FilePickerDemo> {
  String _fileText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("File Picker"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _pickFile,
                child: Text("Pick File"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _pickMultipleFiles,
                child: Text("Pick Multiple Files"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _pickDirectory,
                child: Text("Pick Directory"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _saveAs,
                child: Text("Save As"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(_fileText),
            ],
          ),
        ),
      ),
    );
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        // allowedExtensions: ['jpg', 'pdf', 'doc'],
        );

    if (result != null && result.files.single.path != null) {
      /// Load result and file details
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);

      /// normal file
      File _file = File(result.files.single.path!);
      setState(() {
        _fileText = _file.path;
      });
    } else {
      /// User canceled the picker
    }
  }

  void _pickMultipleFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      setState(() {
        _fileText = files.toString();
      });
    } else {
      // User canceled the picker
    }
  }

  void _pickDirectory() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if (selectedDirectory != null) {
      setState(() {
        _fileText = selectedDirectory;
      });
    } else {
      // User canceled the picker
    }
  }

  /// currently only supported for Linux, macOS, Windows
  /// If you want to do this for Android, iOS or Web, watch the following tutorial:
  /// https://youtu.be/fJtFDrjEvE8
  void _saveAs() async {
    if (kIsWeb || Platform.isIOS || Platform.isAndroid) {
      return;
    }

    String? outputFile = await FilePicker.platform.saveFile(
      dialogTitle: 'Please select an output file:',
      fileName: 'output-file.pdf',
    );

    if (outputFile == null) {
      // User canceled the picker
    }
  }

  /// save file on Fireba
}
