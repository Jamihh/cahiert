import 'package:cahiert/Authentification/AuthPage.dart';
import 'package:cahiert/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Connectez-vous en tant que :',
              style: TextStyle(
                fontSize: 28,
                color: Color.fromARGB(225, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Premier groupe de boutons (Admin et Personnel administratif)
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Gérer l'action lorsque l'administrateur appuie sur le bouton.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal:
                              40, // Augmentez cette valeur pour augmenter la largeur du bouton
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color:
                              Colors.lightBlue, // Couleur pour l'administrateur
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.admin_panel_settings,
                              size: 60,
                              color: Color.fromARGB(255, 255, 255,
                                  255), // Couleur de l'icône de l'administrateur
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Admin',
                              style: TextStyle(
                                color: Color.fromARGB(255, 247, 248,
                                    249), // Couleur du texte de l'administrateur
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        // Gérer l'action lorsque le personnel administratif appuie sur le bouton.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal:
                              40, // Augmentez cette valeur pour augmenter la largeur du bouton
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors
                              .lightBlue, // Couleur pour le personnel administratif
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.supervisor_account,
                              size: 60,
                              color: Color.fromARGB(255, 255, 255,
                                  255), // Couleur de l'icône du personnel administratif
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Res.Ped',
                              style: TextStyle(
                                color: Color.fromARGB(255, 247, 248,
                                    249), // Couleur du texte du personnel administratif
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                // Deuxième groupe de boutons (Prof et Étudiant)
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Gérer l'action lorsque le professeur appuie sur le bouton.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal:
                              40, // Augmentez cette valeur pour augmenter la largeur du bouton
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue, // Couleur pour le professeur
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.school,
                              size: 60,
                              color: Color.fromARGB(255, 255, 255,
                                  255), // Couleur de l'icône du professeur
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Prof',
                              style: TextStyle(
                                color: Color.fromARGB(255, 247, 248,
                                    249), // Couleur du texte du professeur
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        // Gérer l'action lorsque l'étudiant appuie sur le bouton.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal:
                              40, // Augmentez cette valeur pour augmenter la largeur du bouton
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue, // Couleur pour l'étudiant
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.person,
                              size: 60,
                              color: Color.fromARGB(255, 255, 255,
                                  255), // Couleur de l'icône de l'étudiant
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Étudiant',
                              style: TextStyle(
                                color: Color.fromARGB(255, 247, 248,
                                    249), // Couleur du texte de l'étudiant
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
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
