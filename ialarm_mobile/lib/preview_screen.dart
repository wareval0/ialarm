import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final String materia;
  final String tipoAlarma;
  final DateTime fechaLimite;
  final String grupo;

  const PreviewScreen({
    Key? key,
    required this.titulo,
    required this.descripcion,
    required this.materia,
    required this.tipoAlarma,
    required this.fechaLimite,
    required this.grupo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Previsualización de Tarea', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF083D77),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 36.0),
                const Text(
                  'Confirma tu tarea',
                  style: TextStyle(fontSize: 30.0, color: Color(0xFF2E4057)),
                ),
                const SizedBox(height: 26.0),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF2E4057)),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 0, // Set elevation to 0 to remove the shadow
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: const Text("Tarea", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFF2E4057))),
                        subtitle: const Text("Tiempo estimado: 2:00 horas"),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset('assets/images/sonido.png', fit: BoxFit.cover, width: double.infinity),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titulo,
                              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Color(0xFF2E4057)),
                            ),
                            Text(
                              "Fecha Límite: ${fechaLimite.day}/${fechaLimite.month}/${fechaLimite.year}",
                              style: const TextStyle(fontSize: 14.0, color: Color(0xFF083D77)),
                            ),
                            const SizedBox(height: 42.0),
                            Text(
                              descripcion,
                              style: const TextStyle(fontSize: 14.0, color: Color(0xFF083D77)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26.0),
                const Center(
                  child: Text(
                    "Alarma programada para el 11 de Febrero, 10:00 p.m.",
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF2E4057), fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF083D77),
                      side: const BorderSide(color: Color(0xFF083D77)),
                    ),
                    child: const Text('Cancelar'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navegar a la siguiente pantalla
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF083D77),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Crear'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}