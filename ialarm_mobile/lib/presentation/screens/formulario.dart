import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'loading_screen.dart';

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
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _diaController = TextEditingController();
  final TextEditingController _mesController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  bool _isRecording = false;
  bool _showNote = true; // Variable de estado para controlar la visibilidad de la nota

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Tarea', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF083D77),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/home', extra: {'showTaskCard': true});
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Título',
                      style: TextStyle(fontSize: 24.0, color: Color(0xFF2E4057))),
                  TextFormField(
                    controller: _tituloController,
                    decoration: const InputDecoration(
                      hintText: 'Título de la tarea',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un título';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32.0),
                  const Text('Descripción',
                      style: TextStyle(fontSize: 24.0, color: Color(0xFF2E4057))),
                  TextFormField(
                    controller: _descripcionController,
                    decoration: const InputDecoration(
                      hintText: 'Escribe una descripción lo más detallada que quieras',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                    ),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese una descripción';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      const Text('Materia ',
                          style: TextStyle(fontSize: 24.0, color: Color(0xFF2E4057))),
                      const SizedBox(width: 36.0),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            hintText: 'Seleccionar',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text('Tipo de Alarma',
                      style: TextStyle(fontSize: 24.0, color: Color(0xFF2E4057))),
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
                              backgroundColor: _opcionSeleccionada == 'Sonar'
                                  ? const Color(0xFF083D77) // Azul seleccionado
                                  : Colors.transparent, // Fondo transparente cuando no está seleccionado
                              foregroundColor: _opcionSeleccionada == 'Sonar'
                                  ? Colors.white // Texto blanco cuando está seleccionado
                                  : const Color(0xFF2E4057), // Texto normal cuando no está seleccionado
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              side: BorderSide(
                                color: _opcionSeleccionada == 'Sonar'
                                    ? const Color(0xFF083D77) // Borde azul cuando está seleccionado
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
                              backgroundColor: _opcionSeleccionada == 'Vibrar'
                                  ? const Color(0xFF083D77)
                                  : Colors.transparent,
                              foregroundColor: _opcionSeleccionada == 'Vibrar'
                                  ? Colors.white
                                  : const Color(0xFF2E4057),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              side: BorderSide(
                                color: _opcionSeleccionada == 'Vibrar'
                                    ? const Color(0xFF083D77)
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
                              backgroundColor: _opcionSeleccionada == 'Notificar'
                                  ? const Color(0xFF083D77)
                                  : Colors.transparent,
                              foregroundColor: _opcionSeleccionada == 'Notificar'
                                  ? Colors.white
                                  : const Color(0xFF2E4057),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              side: BorderSide(
                                color: _opcionSeleccionada == 'Notificar'
                                    ? const Color(0xFF083D77)
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
                  const Text('Fecha Límite',
                      style: TextStyle(fontSize: 24.0, color: Color(0xFF2E4057))),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _diaController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
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
                            contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
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
                            contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
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
                        icon: const Icon(Icons.calendar_today_rounded),
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
                  Row(
                    children: [
                      const Text(
                        'Grupo ',
                        style: TextStyle(fontSize: 24.0, color: Color(0xFF2E4057)),
                      ),
                      const SizedBox(width: 36.0), // Agrega espacio entre el label y el campo
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            hintText: 'Seleccionar',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                          ),
                          items: <String>['Grupo A', 'Grupo B', 'Grupo C'].map((String value) {
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_showNote)
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    // Ajustamos el ancho del contenedor al 40% del padre
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: const EdgeInsets.only(bottom: 8.0), // Espacio entre la nota y los botones
                    decoration: BoxDecoration(
                      color: const Color(0xFF2E4057),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text(
                            '¡Ahora puedes agregar notas de voz a tu tarea!',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              _showNote = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                // Usamos Stack para posicionar el micrófono en el centro y la flecha a la derecha
                Stack(
                  alignment: Alignment.center, // Centra los elementos dentro del Stack
                  children: [
                    Align(
                      alignment: Alignment.center, // Centra el botón del micrófono
                      child: GestureDetector(
                        onTapDown: (_) {
                          setState(() {
                            _isRecording = true;
                          });
                        },
                        onTapUp: (_) {
                          setState(() {
                            _isRecording = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _isRecording ? const Color(0xFFEF2D56) : const Color(0xFF2E4057),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            _isRecording ? Icons.stop : Icons.mic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight, // Coloca el botón de la flecha a la derecha
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoadingScreen(
                                  titulo: _tituloController.text,
                                  descripcion: _descripcionController.text,
                                  materia: _materiaSeleccionada!,
                                  tipoAlarma: _opcionSeleccionada!,
                                  fechaLimite: _fechaSeleccionada!,
                                  grupo: _grupoSeleccionado!,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}