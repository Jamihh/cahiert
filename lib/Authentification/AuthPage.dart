import 'package:cahiert/HomePage/AdminHomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AdminAuthPageState createState() => _AdminAuthPageState();
}

class _AdminAuthPageState extends State<AuthPage> {
  // Contrôleurs pour les champs de texte
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mdpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentification Admin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/b.png', // Chemin de votre image
                width: 130, // Ajustez la largeur de l'image selon vos besoins
                height: 130, // Ajustez la hauteur de l'image selon vos besoins
              ),
            ),
            const SizedBox(height: 20),
            const Icon(
              Icons.admin_panel_settings,
              size: 60,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bienvenue, Admin',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: emailController, // Champ pour l'adresse e-mail
                keyboardType:
                    TextInputType.emailAddress, // Clavier pour l'adresse e-mail
                decoration: const InputDecoration(
                  labelText: 'Adresse E-mail', // Texte du champ
                  prefixIcon: Icon(Icons.email), // Icône de l'adresse e-mail
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: mdpController, // Champ pour le mot de passe
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final String email = emailController.text;
                  final String password = mdpController.text;

                  UserCredential userCredential =
                      await auth.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  if (userCredential.user != null) {
                    final user = userCredential.user!;
                    final userData = await FirebaseFirestore.instance
                        .collection('votre_collection')
                        .doc(user.uid)
                        .get();
                    final userRole = userData['role'];

                    switch (userRole) {
                      case 'admin':
                        Navigator.pushReplacement(
                          context, // Le contexte actuel
                          MaterialPageRoute(
                            builder: (context) =>
                                const AdminHomePage(), // Page de redirection
                          ),
                        );
                        break;

                      default:
                        // Gérez d'autres rôles ici
                        break;
                    }
                  }
                } catch (e) {
                  print('Erreur d\'authentification: $e');
                  // Gérez les erreurs d'authentification ici, par exemple, affichez un message d'erreur à l'utilisateur.
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Se Connecter',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
