import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showTaskCard = true; // Variable para controlar si mostrar o no la TaskCard

  @override
  void initState() {
    super.initState();
    // Obtener el valor de showTaskCard desde los parámetros de navegación
    final args = GoRouter.of(context).routerDelegate.currentConfiguration.extra as Map<String, dynamic>?;
    if (args != null && args.containsKey('showTaskCard')) {
      _showTaskCard = args['showTaskCard'];
    }
  }

  // Método para cambiar el valor de la variable
  void _toggleTaskCard(bool value) {
    setState(() {
      _showTaskCard = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final fontStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pendientes', style: TextStyle(color: Colors.white),),
        backgroundColor: colorTheme.primary,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: _MyDrawer(colorTheme: colorTheme, fontStyle: fontStyle),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                DayColumn(day: 'D', dayNumber: '9', isHighlighted: false),
                DayColumn(day: 'L', dayNumber: '10', isHighlighted: false),
                DayColumn(day: 'M', dayNumber: '11', isHighlighted: false),
                DayColumn(day: 'M', dayNumber: '12', isHighlighted: false),
                DayColumn(day: 'J', dayNumber: '13', isHighlighted: true),
                DayColumn(day: 'V', dayNumber: '14', isHighlighted: false),
                DayColumn(day: 'S', dayNumber: '15', isHighlighted: false),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
              child: Divider(color: colorTheme.primary),
            ),

            // Renderizado condicional de TaskCard
            if (_showTaskCard) 
              Padding(
                padding: const EdgeInsets.all(16),
                child: TaskCard(
                  onCompleted: () => _toggleTaskCard(false),
                ),
              ),

            if (_showTaskCard)
              Padding(
                padding: EdgeInsets.fromLTRB(16, 5, 8, 0),
                child: Divider(color: colorTheme.primary),
              ),

            if (!_showTaskCard)
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 10),
                child: ThickCheckIcon(size: 100.0, color: Color(0xFF083D77)),
              ),
              /* Padding(
                padding: const EdgeInsets.fromLTRB(16, 50, 16, 50),
                child: Icon(Icons.check_circle, color: colorTheme.primary, size: 150),
              ), */

            Text(
              'No hay más tareas para este día',
              style: fontStyle.bodySmall?.copyWith(color: Colors.black, fontSize: 16),
            ),
            SizedBox(height: 30),

            // Botón de Crear
            OutlinedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(160, 40)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(colorTheme.primary),
                side: MaterialStateProperty.all(BorderSide(color: colorTheme.primary, width: 1)),
              ),
              onPressed: () {
                context.go('/create_alarm');
              },
              child: const Text(
                'Crear', 
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyDrawer extends StatelessWidget {
  const _MyDrawer({
    required this.colorTheme,
    required this.fontStyle,
  });

  final ColorScheme colorTheme;
  final TextTheme fontStyle;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colorTheme.primary.withAlpha(200),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Column(
                children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  'assets/images/nombreApp.png',
                  width: 180,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            ListTile(
                title: Center(child: Text('Ir a la versión web', style: TextStyle(color: Colors.white, fontSize: 22.0))),
              onTap: () => context.go('/initial'),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 28, 10),
              child: Divider(color: Colors.white),  // Divider blanco
            ),
            ListTile(
              title: Center(child: Text('Cerrar sesión', style: TextStyle(color: Colors.white, fontSize: 22.0))),
              onTap: () => context.go('/initial'),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 28, 10),
              child: Divider(color: Colors.white),  // Divider blanco
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final void Function() onCompleted;  // Aseguramos que recibimos la función para completar la tarea

  const TaskCard({super.key, required this.onCompleted});  // Constructor para recibir la función

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final fontStyle = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: colorTheme.primary, width: 1),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título y tiempo estimado
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tarea',
                  style: fontStyle.titleLarge?.copyWith(color: colorTheme.primary, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    // Acción para cerrar el widget
                  },
                ),
              ],
            ),
            Text(
              'Tiempo estimado: 2:00 horas',
              style: fontStyle.bodySmall?.copyWith(color: colorTheme.primary, fontSize: 14),
            ),
            SizedBox(height: 20),

            // Gráfico de onda
            Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sonido.png'), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Descripción de la tarea
            Text(
              'Taller Desarrollo de Software',
              style: fontStyle.titleMedium?.copyWith(color: colorTheme.primary, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Fecha límite: 13 de Febrero, 11:59 p.m.',
              style: fontStyle.bodySmall?.copyWith(color: colorTheme.primary, fontSize: 14),
            ),
            SizedBox(height: 10),
            Text(
              'Desarrollar modelo conceptual (UML) del proyecto CarMotor con sus debidas relaciones.',
              style: fontStyle.bodySmall?.copyWith(color: Colors.black, fontSize: 14),
            ),
            SizedBox(height: 20),

            // Botón de tarea completada
            Align(
              alignment: Alignment.center,
              child: FilledButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(160, 40)),
                  backgroundColor: MaterialStateProperty.all(colorTheme.primary),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: onCompleted,  // Llama a la función onCompleted cuando se presiona el botón
                child: const Text('Completada', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DayColumn extends StatelessWidget {
  final String day;
  final String dayNumber;
  final bool isHighlighted;

  const DayColumn({super.key, required this.day, required this.dayNumber, required this.isHighlighted});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final fontStyle = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          day,
          style: fontStyle.bodyLarge?.copyWith(color: colorTheme.primary, fontWeight: FontWeight.w300),
        ),
        
        isHighlighted ? SizedBox(height: 1) : SizedBox(height: 4),

        isHighlighted
            ? Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: colorTheme.primary, 
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    dayNumber,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            : Text(
                dayNumber,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
      ],
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