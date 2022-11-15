import 'package:examen_calendari/editar_esdeveniment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'controlador.dart';
import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {'/editar':(context)=>EditarEsdevenimentForm()},
      home: MyHomePage(
        title: "Calendari Raul Tadeo",
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final Controlador elControlador = Controlador();

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
          LlistatEsdevenimentsWidget(llistaEsdeveniments: widget.elControlador.getListaEsdeveniments()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/editar');
        },
        tooltip: 'Afegir esdeveniment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LlistatEsdevenimentsWidget extends StatelessWidget {
  const LlistatEsdevenimentsWidget({
    Key? key,
    required this.llistaEsdeveniments,
  }) : super(key: key);

  final List<Esdeveniment> llistaEsdeveniments;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (Esdeveniment lEsdeveniment in llistaEsdeveniments)
          EsdevenimentWidget(lEsdeveniment)
      ],
    );
  }
}

class EsdevenimentWidget extends StatelessWidget {
  const EsdevenimentWidget(
    this.esdeveniment, {
    Key? key,
  }) : super(key: key);

  final Esdeveniment esdeveniment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          "${DateFormat("yyyy-MM-dd").format(esdeveniment.horaInici)}: ${esdeveniment.titol}: ${esdeveniment.descripcio}"),
    );
  }
}
