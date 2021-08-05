import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Somador",
      home: MyFields(),
    );
  }
}

class MyFields extends StatefulWidget {
  const MyFields({Key? key}) : super(key: key);

  @override
  _MyFieldsState createState() => _MyFieldsState();
}

class _MyFieldsState extends State<MyFields> {
  late TextEditingController _controller, _controller2;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Somador'),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numero 1',
                ),
              ),
            ),
            Card(
              child: TextField(
                controller: _controller2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numero 2',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => {

              },
              child: Text("Press"),
            ),
            Text('Somador  ')
          ],
        ),
      ),
    );
  }
}
