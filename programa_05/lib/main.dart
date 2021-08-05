import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

  class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text("Somador"),
  ),
  body: MyFields(),
  );
  }
  }

  class MyFields extends StatefulWidget {
  const MyFields({Key? key}) : super(key: key);

  @override
  _MyFieldsState createState() => _MyFieldsState();
  }

  class _MyFieldsState extends State<MyFields> {
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
  return Container(
  child: Column(
  children: [
  TextField(
  controller: _controller,
  decoration: InputDecoration(
  border: OutlineInputBorder(),
  ))
  ],
  ),
  );
  }
  }

}