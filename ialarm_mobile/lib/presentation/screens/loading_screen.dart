import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'preview_screen.dart';

class LoadingScreen extends StatefulWidget {
  final String titulo;
  final String descripcion;
  final String materia;
  final String tipoAlarma;
  final DateTime fechaLimite;
  final String grupo;

  const LoadingScreen({
    Key? key,
    required this.titulo,
    required this.descripcion,
    required this.materia,
    required this.tipoAlarma,
    required this.fechaLimite,
    required this.grupo,
  }) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Duración de la rotación
    )..repeat(); // Repite indefinidamente

    // Simula una carga de 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(
            titulo: widget.titulo,
            descripcion: widget.descripcion,
            materia: widget.materia,
            tipoAlarma: widget.tipoAlarma,
            fechaLimite: widget.fechaLimite,
            grupo: widget.grupo,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: RotationTransition(
                  turns: _controller,
                  child: CustomPaint(
                    painter: CircularGradientPainter(1.0),
                    child: Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Estimando la duración de tu tarea...',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Color(0xFF2E4057),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularGradientPainter extends CustomPainter {
  final double progress;

  CircularGradientPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = SweepGradient(
        startAngle: 0.0,
        endAngle: 2 * pi,
        colors: [Color(0xFF083D77), Colors.white],
        stops: [0.0, 1.0],
      ).createShader(Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round; // Punta redondeada

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Empieza en la parte superior
      progress * 2 * pi, // Progreso dinámico
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CircularGradientPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
