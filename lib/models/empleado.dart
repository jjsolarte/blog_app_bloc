class Empleado{
  int _id;
  String _nombre;
  double _salario;

  Empleado(this._id, this._nombre, this._salario);

  double get salario => _salario;

  set salario(double value) {
    _salario = value;
  }

  String get nombre => _nombre;

  set nombre(String value) {
    _nombre = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

}