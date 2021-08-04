import 'package:flutter/material.dart';
import 'adicionaContato.dart';
import 'contato.dart';

class listaContatos extends StatefulWidget {
  @override
  _listaContatosState createState() => _listaContatosState();
}

class _listaContatosState extends State<listaContatos> {
  List<contato> meusContatos = [];

  _listaContatosState(){
    meusContatos.add(contato("Edson",44,"999999999","edson.moreno@pucrs.br"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Minha lista de contatos")),
      body: ListView.builder(
          itemCount: meusContatos.length,
          itemBuilder: (context, indice) {

            return Dismissible(
                child: Card(
                  child: ListTile(
                    leading: (meusContatos[indice].ehHomem)?Icon(Icons.handyman):Icon(Icons.person),
                    title: Text("Nome: ${meusContatos[indice].nome}"),
                    subtitle: Text("Fone: ${meusContatos[indice].telefone}"),
                    onTap: () => Navigator.pushNamed(context, "/detalhesdoContato", arguments: meusContatos[indice]),
                  ),
                ),
                key: ValueKey(meusContatos[indice]),
                onDismissed: (direction) {
                  setState((){
                    meusContatos.removeAt(indice); }
            );},
              background: Container(
                color: Colors.green,
                child: Icon(Icons.check),

              ), secondaryBackground: Container(
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: Icon(Icons.cancel),

              ),

              );
          }
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_circle),
          onPressed: () async{
            contato novoContato = await Navigator.push(context, MaterialPageRoute(builder: (_)=> adicionaContato()));
            if(novoContato!=null){
              setState(()=> meusContatos.add(novoContato));
            }
          }
      ),
    );
  }
}