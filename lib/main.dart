// @dart = 2.9

import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dataButton.dart';

const request = "https://api.hgbrasil.com/finance?format=json-cor&key=d9e5e72d";

void main() async {
  runApp(const MyApp());
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body)['results']['stocks'];
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App financeira',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();
  final String title = 'Financeira Bolsa de Valores';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final toConvertController = TextEditingController();
  final convertToController = TextEditingController();

  double toConvert = 0;
  double convertTo = 0;
  String dropdownValue = 'Escolha uma moeda para conversão';

  void _clearAll() {
    toConvertController.text = "";
    convertToController.text = "";
  }

  void _change(String toConvertText, String converToText) {
    if (toConvertText.isEmpty) {
      _clearAll();
      return;
    }
    double toConvert = double.parse(toConvertText);
    double convertTo = double.parse(converToText);
    convertToController.text = (toConvert / convertTo).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: FutureBuilder<Map>(
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return const Center(
                      child: Text(
                    "Carregando dados...",
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ));
                default:
                  if (snapshot.hasError) {
                    return const Center(
                        child: Text(
                      "Erro ao carregar os dados...",
                      style: TextStyle(color: Colors.green, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ));
                  } else {
                    return Column(
                      children: [
                        DataButton(snapshot.data, 'IBOVESPA'),
                        DataButton(snapshot.data, 'NASDAQ'),
                        DataButton(snapshot.data, 'DOWJONES'),
                        DataButton(snapshot.data, 'NIKKEI'),
                        DataButton(snapshot.data, 'CAC')
                      ],
                    );
                  }
              }
            }));
  }
}
