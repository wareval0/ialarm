import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 2), () {
      context.go('/home', extra: {'showTaskCard': true});
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ThickCheckIcon(size: 100.0, color: Color(0xFF083D77)), // Nuevo ícono grueso
            const SizedBox(height: 8.0),
            const Text(
              'Tarea guardada con éxito',
              style: TextStyle(fontSize: 24.0, color: Color(0xFF2E4057), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class ThickCheckIcon extends StatelessWidget {
  final double size;
  final Color color;

  const ThickCheckIcon({super.key, this.size = 100.0, this.color = const Color(0xFF083D77)});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: CheckPainter(color),
    );
  }
}

class CheckPainter extends CustomPainter {
  final Color color;

  CheckPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0 // Grosor del trazo
      ..strokeCap = StrokeCap.square;

    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.55)
      ..lineTo(size.width * 0.4, size.height * 0.75)
      ..lineTo(size.width * 0.8, size.height * 0.3);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
