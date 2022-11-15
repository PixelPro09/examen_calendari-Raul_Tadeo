import 'package:examen_calendari/model.dart';

class Controlador{
  DateTime? horaInici, horaFinal;
  String? titol;
  String? descripcio;

  List <Esdeveniment> getListaEsdeveniments(){
    return Modelo().esdeveniments;
  }

  void save() {
    Modelo().afegirEsdeveniments(
        Esdeveniment(
        horaInici: horaInici!,
        horaFinal: horaFinal!,
        titol: titol!,
        descripcio: descripcio
        )
    );

  }
}