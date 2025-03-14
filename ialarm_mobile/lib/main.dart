import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Formulario'),
        ),
        body: const Formulario(),
      ),
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  String? _materiaSeleccionada;
  String? _opcionSeleccionada;
  DateTime? _fechaSeleccionada;
  String? _grupoSeleccionado;
  final TextEditingController _diaController = TextEditingController();
  final TextEditingController _mesController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Título'),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese un título';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            const Text('Descripción'),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese una descripción';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            const Text('Materia'),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: <String>['DSW', 'Dalgo', 'UX', 'Sistrans']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _materiaSeleccionada = newValue;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Por favor seleccione una materia';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            const Text('Opciones'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _opcionSeleccionada = 'Sonar';
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        side: BorderSide(
                          color: _opcionSeleccionada == 'Sonar'
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                      child: const Text('Sonar'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _opcionSeleccionada = 'Vibrar';
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        side: BorderSide(
                          color: _opcionSeleccionada == 'Vibrar'
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                      child: const Text('Vibrar'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _opcionSeleccionada = 'Notificar';
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        side: BorderSide(
                          color: _opcionSeleccionada == 'Notificar'
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                      child: const Text('Notificar'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text('Fecha'),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _diaController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'DD',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Día';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    controller: _mesController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'MM',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mes';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    controller: _anoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'AAAA',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Año';
                      }
                      return null;
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null) {
                      setState(() {
                        _fechaSeleccionada = picked;
                        _diaController.text = picked.day.toString().padLeft(2, '0');
                        _mesController.text = picked.month.toString().padLeft(2, '0');
                        _anoController.text = picked.year.toString();
                      });
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text('Grupo'),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: <String>['Grupo A', 'Grupo B', 'Grupo C']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _grupoSeleccionado = newValue;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Por favor seleccione un grupo';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Procesar los datos del formulario
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
