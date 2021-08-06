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
  int? somador_1 = 0;
  int? somador_2 = 0;
  var total = 0;

  void _totalState() {
    setState(() {
      total = somador_1! + somador_2!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Somador'),
      ),
      body: Center(
        child: Column(children: [
          Card(
            child: TextField(
              onChanged: (value) {
                setState(()=> {
                somador_1=int.tryParse(value)
                }
                );
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Numero 1',
              ),
            ),
          ),
          Card(
            child: TextField(
              onChanged: (value) {
                setState(()=> {

                    somador_2 = int.tryParse(value)

                }
                );
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Numero 2',
              ),
            ),
          ),
          ElevatedButton(
            onPressed:
                ((somador_1 != null) && (somador_2 != null)) ? _totalState : null,
            child: Text("Press"),
          ),
          Card(
            child: Column(
              children: [
                Text(
                  'SOMADOR',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Center(
                    child: Text(
                  '${total}',
                  style: TextStyle(fontSize: 22),
                )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
