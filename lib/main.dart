import 'package:cahiert/Authentification/AuthPage.dart';
import 'package:cahiert/WelcomePage.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/adminauth': (context) => const AuthPage(),
      },
      title: 'EASYCLASSNOTES',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white, // Couleur de fond blanche
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/web.png', // Remplacez par le chemin correct de votre logo.
              width: 350, // Ajustez la largeur de l'image selon vos besoins.
              height: 350, // Ajustez la hauteur de l'image selon vos besoins.
            ),
            const SizedBox(height: 20),
            const Text(
              'Bienvenue dans EasyClassNotes !',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Naviguez vers la page principale (main.dart) ou toute autre page souhaitée.
                Navigator.of(context).pushNamed('/welcome');
              },
              child: const Text('Commencer'),
            ),
          ],
        ),
      ),
    ));
  }
}
