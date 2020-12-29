import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final namaController = TextEditingController();

  final telefonController = TextEditingController();

  _savedValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nama', namaController.text);
    prefs.setString('telefon', telefonController.text);
  }

  _getValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //state management -> tukar state sesuatu object/widget dan refresh skrin
    setState(() {
      namaController.text = prefs.getString('nama');
      telefonController.text = prefs.getString('telefon');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Text('Nama: '),
                TextField(controller: namaController),
                Text('Telefon: '),
                TextField(controller: telefonController),
                RaisedButton(
                  child: Text('Save Data'),
                  onPressed: () => _savedValues()),
                  RaisedButton(
                  child: Text('Get Data'),
                  onPressed: () => _getValues()),
                Text(namaController.text),
                Text(telefonController.text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
