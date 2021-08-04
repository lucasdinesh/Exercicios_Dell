import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'listaContatos.dart';
import 'adicionaContato.dart';
import 'detalhesdoContato.dart';

void main() {
  runApp(MaterialApp(
    title: "aplicativo Lista",
    initialRoute: '/',
    routes: {
      "/": (context) => listaContatos(),
      "/adicionaContato": (context) => adicionaContato(),
      "/detalhesdoContato": (context) => detalhesDoContato(),
    },
  ));
}
