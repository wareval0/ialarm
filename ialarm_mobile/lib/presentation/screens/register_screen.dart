import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final fontStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse', style: fontStyle.bodySmall?.copyWith(color: Colors.white)),
        backgroundColor: colorTheme.primary,
        iconTheme: IconThemeData(color: Colors.white)
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),

            FilledButton.icon(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(Size(186, 186)),
                backgroundColor: WidgetStateProperty.all(colorTheme.primary),
                foregroundColor: WidgetStateProperty.all(colorTheme.primary),
              ),
              onPressed: () => {},
              icon: Icon(Icons.camera_alt_outlined, size: 100, color: Colors.white,),
              label: const Text(''),
            ),
        
            SizedBox(height: 30),
        
            SizedBox(
              width: 350,
              height: 70,
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: fontStyle.bodyMedium?.copyWith(color: colorTheme.primary),
                  fillColor: colorTheme.surface,
                  border: OutlineInputBorder(),
                  label: Text('Nombre', style: fontStyle.bodyMedium,)
                ),
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: 350,
              height: 70,
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: fontStyle.bodyMedium?.copyWith(color: colorTheme.primary),
                  fillColor: colorTheme.surface,
                  border: OutlineInputBorder(),
                  label: Text('Usuario', style: fontStyle.bodyMedium,)
                ),
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: 350,
              height: 70,
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: fontStyle.bodyMedium?.copyWith(color: colorTheme.primary),
                  fillColor: colorTheme.surface,
                  border: OutlineInputBorder(),
                  label: Text('Correo Electrónico', style: fontStyle.bodyMedium,)
                ),
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: 350,
              height: 70,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintStyle: fontStyle.bodyMedium?.copyWith(color: colorTheme.primary),
                  fillColor: colorTheme.surface,
                  border: OutlineInputBorder(),
                  label: Text('Contraseña', style: fontStyle.bodyMedium,)
                ),
              ),
            ),

            SizedBox(height: 20),

            FilledButton(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(Size(160, 40)),
                backgroundColor: WidgetStateProperty.all(colorTheme.primary),
                foregroundColor: WidgetStateProperty.all(Colors.white),
              ),
              onPressed: () => context.go('/home'),
              child: const Text('Registrarse', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            ),

            SizedBox(height: 20),

            // iniciar sesión debe ser un link para ir a la pantalla de inicio de sesión. Debe ser un texto con underline
            // Si ya tiene una cuenta, puede Iniciar Sesión
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Si ya tiene una cuenta, puede ', style: fontStyle.bodySmall?.copyWith(fontSize: 15)),
                TextButton(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () => context.go('/home'),
                  child: Text('Iniciar Sesión', style: fontStyle.bodySmall?.copyWith(fontSize: 15, decoration: TextDecoration.underline)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}