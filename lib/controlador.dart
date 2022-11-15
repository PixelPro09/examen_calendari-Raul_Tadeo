import 'package:examen_calendari/model.dart';

class Controlador{
  List <Esdeveniment> getListaEsdeveniments(){
    return Modelo().esdeveniments;
  }
}