import 'package:flutter/material.dart';

import 'address.dart';

class detailscreen extends StatelessWidget {
  final List<Address?> enderecos;

  const detailscreen({Key? key, required this.enderecos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Endereços'),
      ),
      body: ListView.builder(
        itemCount: enderecos.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5.5,
            child: ListTile(
              title: Text(
                "${enderecos[index]!.get_value('logradouro')}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              subtitle: Text('${enderecos[index]!.get_value('cep')}'),
            ),
          );
        },
      ),
    );
  }
}
