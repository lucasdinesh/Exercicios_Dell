import 'package:flutter/material.dart';
import 'address.dart';
import 'package:http/http.dart' as http;

void main() => (runApp(HomePage()));

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Pesquisa Cep', home: PesquisaCep());
  }
}

class PesquisaCep extends StatefulWidget {
  const PesquisaCep({Key? key}) : super(key: key);

  @override
  _PesquisaCepState createState() => _PesquisaCepState();
}

class _PesquisaCepState extends State<PesquisaCep> {
  String? cep;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisa Cep'),
      ),
      body: Column(
        children: [
          TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Cep'),
              onChanged: (value) {
                setState(() => {cep = value});
              }),
          ElevatedButton(
              onPressed: () async {
                var url = 'https://viacep.com.br/ws/${cep}/json/';
                var uri = Uri.parse(url);
                var response = await http.get(uri);
                var address = Address.fromJson(response.body);
                address.print_address();
              },
              child: Text(
                'Enviar',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
