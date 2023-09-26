import 'package:flutter/material.dart';

class EtuHomePage extends StatelessWidget {
  const EtuHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil de l'étudiant"),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/etu.png'),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Bonjour, étudiant !',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildActionButton(
                    context,
                    'Voir le cahier de texte',
                    Icons.book,
                    Colors.green,
                    () {
                      _showHomework(context);
                    },
                  ),
                  _buildActionButton(
                    context,
                    'Voir mes présences',
                    Icons.calendar_today,
                    Colors.orange,
                    () {
                      _showAttendanceCalendar(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    // Votre code de déconnexion va ici
    // Par exemple, vous pouvez naviguer vers la page de connexion
    Navigator.pushReplacementNamed(context, '/etuauth');
  }

  Widget _buildActionButton(BuildContext context, String label, IconData icon,
      Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
        minimumSize: const Size(160, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _showHomework(BuildContext context) {
    // Naviguer vers la page du cahier de texte ici
  }

  void _showAttendanceCalendar(BuildContext context) {
    // Naviguer vers la page de calendrier des présences ici
  }
}

void main() {
  runApp(const MaterialApp(
    home: EtuHomePage(),
  ));
}
