import 'package:flutter/material.dart';
import 'package:programa_05/detail_screen.dart';
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

// class view extends StatefulWidget {
//   const view({Key? key}) : super(key: key);
//
//   @override
//   _viewState createState() => _viewState();
// }

// class _viewState extends State<view> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: meusCeps.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(
//             "${meusCeps[index]!.get_value('cep')}",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
//           ),
//         );
//       };
//   }
// }
class Cepsview extends StatelessWidget {
  final List<Address?> ceps;

  const Cepsview({Key? key, required this.ceps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (ceps.length == 0)
        ? SizedBox.shrink()
        : ListView.builder(
            itemCount: ceps.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  "${ceps[index]!.get_value('cep')}",
                  style: TextStyle(fontSize: 14),
                ),
              );
            },
          );
  }
}

class PesquisaCep extends StatefulWidget {
  const PesquisaCep({Key? key}) : super(key: key);

  @override
  _PesquisaCepState createState() => _PesquisaCepState();
}

class _PesquisaCepState extends State<PesquisaCep> {
  String? cep;
  List<Address?> meusCeps = List<Address?>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisa Cep'),
      ),
      body: Column(
        children: [
          Icon(
            Icons.home,
            size: 50,
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cep',
                    hintText: 'Digite seu cep'),
                onChanged: (value) {
                  setState(() => {cep = value});
                }),
          ),
          ElevatedButton(
              onPressed: () async {
                var url = 'https://viacep.com.br/ws/${cep}/json/';
                var uri = Uri.parse(url);
                var response = await http.get(uri);
                var address = Address.fromJson(response.body);
                setState(() {
                  meusCeps.add(address);
                });
              },
              child: Text(
                'Enviar',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Flexible(child: Cepsview(ceps: meusCeps)),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => detailscreen(enderecos: meusCeps)));
        },
        child: Text('Detalhes Ceps'),
      ),
    );
  }
}
