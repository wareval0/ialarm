import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 250,
              height: 250,
            ),

            SizedBox(height: 30),

            Image.asset(
              'assets/images/nombreApp.png',
              width: 300,
              height: 100,
            ),

            SizedBox(height: 100),
            
            FilledButton(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(Size(160, 40)),
                backgroundColor: WidgetStateProperty.all(Colors.white),
                foregroundColor: WidgetStateProperty.all(colorTheme.primary),
              ),
              onPressed: () => context.go('/home'),
              child: const Text('Iniciar Sesión', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            ),

            SizedBox(height: 14),

            OutlinedButton(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(Size(160, 40)),
                backgroundColor: WidgetStateProperty.all(colorTheme.secondary),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                side: WidgetStateProperty.all(BorderSide(color: Colors.white, width: 1))
              ),
              onPressed: () => context.push('/register'),
              child: const Text('Registrarse', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),)
            ),
          ],
        )
      ),
      backgroundColor: colorTheme.primary,
    );
  }
}