import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: PersoHomePage(),
  ));
}

class PersoHomePage extends StatelessWidget {
  const PersoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil de Responsable pédagogique"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          // Bouton de déconnexion
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Mettez ici votre logique de déconnexion
              _logout(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage('assets/images/pa.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Bonjour, Mr !',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSquareActionButton(
                  context,
                  'Gérer Cours',
                  Icons.school,
                  Colors.green,
                  () {
                    _manageCourses(context);
                  },
                ),
                _buildSquareActionButton(
                  context,
                  'Gérer Comptes',
                  Icons.account_circle,
                  Colors.orange,
                  () {
                    _manageStudentAccounts(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSquareActionButton(
                  context,
                  'Gérer Classes',
                  Icons.class_,
                  Colors.blue,
                  () {
                    _manageClasses(context);
                  },
                ),
                _buildSquareActionButton(
                  context,
                  'Consulter Présence',
                  Icons.event_note,
                  Colors.purple,
                  () {
                    _checkAttendance(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSquareActionButton(
                  context,
                  'Générer Rapport',
                  Icons.description,
                  Colors.red,
                  () {
                    _generateReport(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    // Votre code de déconnexion va ici
    // Par exemple, vous pouvez naviguer vers la page de connexion
    Navigator.pushReplacementNamed(context, '/persoauth');
  }

  // Méthodes pour gérer les actions des boutons
  void _manageCourses(BuildContext context) {
    // Votre code pour gérer les cours va ici
    // ...
  }

  void _manageStudentAccounts(BuildContext context) {
    // Votre code pour gérer les comptes étudiants va ici
    // ...
  }

  void _manageClasses(BuildContext context) {
    // Votre code pour gérer les classes va ici
    // ...
  }

  void _checkAttendance(BuildContext context) {
    // Votre code pour consulter la présence va ici
    // ...
  }

  void _generateReport(BuildContext context) {
    // Votre code pour générer un rapport va ici
    // ...
  }

  Widget _buildSquareActionButton(BuildContext context, String label,
      IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: color, disabledForegroundColor: color.withOpacity(0.8).withOpacity(0.38), disabledBackgroundColor: color.withOpacity(0.8).withOpacity(0.12),
        minimumSize: const Size(100, 100), // Taille carrée
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
