/* Patron Bloc
1. Imports
2. Lista de empleados
3. Streams Controles
4. Streams Sink Getters
5. Constructor - añadir data, escuchar cambios
6. Funciones principales
7. dispose
*/

//1 Imports
import 'dart:async';
import '../models/empleado.dart';

//2 Lista de empleados
class EmpleadoBloc {
  List<Empleado> _empleadoList = [
    Empleado(1, "Esclavo 1", 1000.0),
    Empleado(2, "Esclavo 2", 2000.0),
    Empleado(3, "Esclavo 3", 3000.0),
    Empleado(4, "Esclavo 4", 4000.0),
    Empleado(5, "Esclavo 5", 5000.0),
  ];

  //3 Streams Controles
  final _empleadoListStreamController = StreamController<List<Empleado>>();

  final _empleadoSalarioIncrementarStreamController =
      StreamController<Empleado>();
  final _empleadoSalarioDecrementarStreamController =
      StreamController<Empleado>();

  //4 Streams Sink Getters
  //Getters: Streams y Sinks

  //Estructura: 1. Tipo de Dato: Stream<List<Empleado>>
  //            2. Keyword: get
  //            3. Nombre Getter
  //            4. Retorno
  Stream<List<Empleado>> get empleadoListStream =>
      _empleadoListStreamController.stream;
  StreamSink<List<Empleado>> get empleadoListSink =>
      _empleadoListStreamController.sink;

  StreamSink<Empleado> get empleadoSalarioIncrement =>
      _empleadoSalarioIncrementarStreamController.sink;

  StreamSink<Empleado> get empleadoSalarioDecrement =>
      _empleadoSalarioDecrementarStreamController.sink;

  //5 Constructor - añadir data, escuchar cambios
  EmpleadoBloc(){
    _empleadoListStreamController.add(_empleadoList);
    _empleadoSalarioIncrementarStreamController.stream.listen(_incrementSalario);
    _empleadoSalarioDecrementarStreamController.stream.listen(_decrementSalario);
  }

  //6 Funciones Principales
  _incrementSalario(Empleado empleado){
    double salarioActual = empleado.salario;
    double incremento = salarioActual * 20/100;

    _empleadoList[empleado.id - 1].salario = salarioActual + incremento;
    empleadoListSink.add(_empleadoList);
  }

  _decrementSalario(Empleado empleado){
    double salarioActual = empleado.salario;
    double incremento = salarioActual * 20/100;

    _empleadoList[empleado.id - 1].salario = salarioActual - incremento;
    empleadoListSink.add(_empleadoList);
  }

  //7 Dispose
  void dispose(){
    _empleadoSalarioIncrementarStreamController.close();
    _empleadoSalarioDecrementarStreamController.close();
    _empleadoListStreamController.close();
  }

}
