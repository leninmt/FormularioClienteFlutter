import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulario App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.blueAccent,
        fontFamily: 'Arial',
      ),
      home: BienvenidaScreen(),
    );
  }
}

class BienvenidaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Bienvenido a la App!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormularioCliente()),
                );
              },
              child: Text('Ir al Formulario'),
            ),
          ],
        ),
      ),
    );
  }
}

class FormularioCliente extends StatefulWidget {
  @override
  _FormularioClienteState createState() => _FormularioClienteState();
}

class _FormularioClienteState extends State<FormularioCliente> {
  final _formKey = GlobalKey<FormState>();

  String _numeroIdentidad = '';
  String _nombre = '';
  String _fechaNacimiento = '';
  String _lugarNacimiento = '';
  String _estadoCivil = '';
  bool _sexoHombre = false;
  String _celular = '';
  String _direccion = '';
  String _email = '';
  String _ciudad = '';
  String _pais = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTextField('Número de Identidad', TextInputType.number,
                    (value) {
                  if (value == null || value.isEmpty || value.length != 10) {
                    return 'Ingrese un número de identidad válido (10 dígitos)';
                  }
                  return null;
                }, (value) => _numeroIdentidad = value ?? ''),
                SizedBox(height: 16),
                _buildTextField('Nombre', TextInputType.text, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese un nombre válido';
                  }
                  return null;
                }, (value) => _nombre = value ?? ''),
                SizedBox(height: 16),
                _buildTextField('Fecha de Nacimiento', TextInputType.text,
                    (value) {
                  // Agregar validación de fecha si es necesario
                  return null;
                }, (value) => _fechaNacimiento = value ?? ''),
                SizedBox(height: 16),
                _buildTextField('Lugar de Nacimiento', TextInputType.text,
                    (value) {
                  // Puedes agregar validaciones adicionales según tus necesidades
                  return null;
                }, (value) => _lugarNacimiento = value ?? ''),
                SizedBox(height: 16),
                _buildDropdownField(
                  'Estado Civil',
                  ['Soltero', 'Casado'],
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Seleccione un estado civil';
                    }
                    return null;
                  },
                  (value) => _estadoCivil = value ?? '',
                ),
                SizedBox(height: 16),
                _buildRadioField('Sexo', ['Hombre', 'Mujer'], (value) {
                  if (value == null || value.isEmpty) {
                    return 'Seleccione un género';
                  }
                  return null;
                }, (value) {
                  setState(() {
                    _sexoHombre = value == 'Hombre';
                  });
                }),
                SizedBox(height: 16),
                _buildTextField('Celular', TextInputType.number, (value) {
                  if (value == null || value.isEmpty || value.length != 10) {
                    return 'Ingrese un número de celular válido (10 dígitos)';
                  }
                  return null;
                }, (value) => _celular = value ?? ''),
                SizedBox(height: 16),
                _buildTextField('Dirección', TextInputType.text, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese una dirección válida';
                  }
                  return null;
                }, (value) => _direccion = value ?? ''),
                SizedBox(height: 16),
                _buildTextField('Email', TextInputType.emailAddress, (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Ingrese un correo electrónico válido';
                  }
                  return null;
                }, (value) => _email = value ?? ''),
                SizedBox(height: 16),
                _buildDropdownField(
                  'Ciudad',
                  ['Quito', 'Guayaquil', 'Cuenca'],
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Seleccione una ciudad';
                    }
                    return null;
                  },
                  (value) => _ciudad = value ?? '',
                ),
                SizedBox(height: 16),
                _buildDropdownField(
                  'País',
                  ['Ecuador', 'Colombia', 'Perú'],
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Seleccione un país';
                    }
                    return null;
                  },
                  (value) => _pais = value ?? '',
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Aquí puedes realizar acciones adicionales con la información del formulario
                      // por ejemplo, enviarla a un servidor o almacenarla localmente.
                      print('Formulario válido. Datos guardados:');
                      print('Número de Identidad: $_numeroIdentidad');
                      print('Nombre: $_nombre');
                      print('Fecha de Nacimiento: $_fechaNacimiento');
                      print('Lugar de Nacimiento: $_lugarNacimiento');
                      print('Estado Civil: $_estadoCivil');
                      print('Sexo: ${_sexoHombre ? 'Hombre' : 'Mujer'}');
                      print('Celular: $_celular');
                      print('Dirección: $_direccion');
                      print('Email: $_email');
                      print('Ciudad: $_ciudad');
                      print('País: $_pais');
                    }
                  },
                  child: Text('Guardar'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Aquí puedes realizar acciones adicionales con la información del formulario
                    // por ejemplo, enviarla a un servidor o almacenarla localmente.
                    print('Formulario válido. Datos guardados:');
                    print('Número de Identidad: $_numeroIdentidad');
                    print('Nombre: $_nombre');
                    print('Fecha de Nacimiento: $_fechaNacimiento');
                    print('Lugar de Nacimiento: $_lugarNacimiento');
                    print('Estado Civil: $_estadoCivil');
                    print('Sexo: ${_sexoHombre ? 'Hombre' : 'Mujer'}');
                    print('Celular: $_celular');
                    print('Dirección: $_direccion');
                    print('Email: $_email');
                    print('Ciudad: $_ciudad');
                    print('País: $_pais');
                  }
                },
                child: Text('Guardar'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                      context); // Regresa a la pantalla anterior (BienvenidaScreen)
                },
                child: Text('Salir'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextInputType keyboardType,
    String? Function(String?)? validator,
    void Function(String?) onSaved,
  ) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }

  Widget _buildDropdownField(
    String label,
    List<String> items,
    String? Function(String?)? validator,
    void Function(String?) onChanged,
  ) {
    return DropdownButtonFormField(
      items: items.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) => onChanged(value as String?),
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  Widget _buildRadioField(
    String label,
    List<String> options,
    String? Function(String?)? validator,
    void Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        Row(
          children: options.map((String option) {
            return Row(
              children: [
                Radio<String>(
                  value: option,
                  groupValue: _sexoHombre ? 'Hombre' : 'Mujer',
                  onChanged: (value) {
                    onChanged(value);
                  },
                ),
                Text(option),
                SizedBox(width: 16),
              ],
            );
          }).toList(),
        ),
        if (validator != null &&
            validator(_sexoHombre ? 'Hombre' : 'Mujer') != null)
          Text(
            validator(_sexoHombre ? 'Hombre' : 'Mujer')!,
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
