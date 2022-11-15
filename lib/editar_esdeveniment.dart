import 'package:flutter/material.dart';

import 'controlador.dart';

class EditarEsdevenimentForm extends StatefulWidget {
  EditarEsdevenimentForm({Key? key}) : super(key: key);
  final Controlador elControlador = Controlador();
  @override
  State<EditarEsdevenimentForm> createState() => _EditarEsdevenimentFormState();
}

class _EditarEsdevenimentFormState extends State<EditarEsdevenimentForm> {
  final _clauFormulari = GlobalKey<FormState>();


  String? validator(String? valor) {
    if (valor != null) {
      return null;
    } else {
      return "Test";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: (){
          if(_clauFormulari.currentState?.validate() == true){
            _clauFormulari.currentState?.save();
            widget.elControlador.save();
          }
          Navigator.of(context).pop();
        },
      ),
      appBar: AppBar(
        title: const Text("Calendari Raul Tadeo"),
      ),
      body: Form(
        key: _clauFormulari,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Data inici"),
                    validator: validator,
                    onSaved: (valor){
                      widget.elControlador.horaInici = DateTime.parse(valor!);
                    },
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Data fi"),
                    validator: validator,
                    onSaved: (valor){
                      widget.elControlador.horaInici = DateTime.parse(valor!);
                    },
                  ),
                )
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Títol"),
              validator: validator,
              onSaved: (valor){
                widget.elControlador.horaInici = DateTime.parse(valor!);
              },
            ),
            Expanded(
              child: TextFormField(
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  labelText: "Descripció",
                  alignLabelWithHint: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
