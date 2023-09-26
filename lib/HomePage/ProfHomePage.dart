import 'package:flutter/material.dart';

class ProfHomePage extends StatelessWidget {
  const ProfHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil du professeur"),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage('assets/images/professeur.png'),
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
            _buildActionButton(
              context,
              'Gérer Séance',
              Icons.calendar_today,
              Colors.purple,
              () {
                _manageSession(context);
              },
            ),
            const SizedBox(height: 20),
            _buildActionButton(
              context,
              'Consulter Séance',
              Icons.event,
              Colors.teal,
              () {
                _viewSession(context);
              },
            ),
            const SizedBox(height: 20),
            _buildActionButton(
              context,
              'Cahier de Texte',
              Icons.note,
              Colors.deepOrange,
              () {
                _notebook(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Exemple de méthode pour gérer la déconnexion
  void _logout(BuildContext context) {
    // Votre code de déconnexion va ici
    // Par exemple, vous pouvez naviguer vers la page de connexion
    Navigator.pushReplacementNamed(context, '/profauth');
  }

  // ... (Le reste de vos méthodes pour gérer les actions des boutons)

  // Exemple de méthode pour gérer une séance
  void _manageSession(BuildContext context) {
    // Votre code pour gérer une séance va ici
    // ...
  }

  // Exemple de méthode pour consulter une séance
  void _viewSession(BuildContext context) {
    // Votre code pour consulter une séance va ici
    // ...
  }

  // Exemple de méthode pour accéder au cahier de texte
  void _notebook(BuildContext context) {
    // Votre code pour accéder au cahier de texte va ici
    // ...
  }

  Widget _buildActionButton(BuildContext context, String label, IconData icon,
      Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: color, disabledForegroundColor: color.withOpacity(0.8).withOpacity(0.38), disabledBackgroundColor: color.withOpacity(0.8).withOpacity(0.12),
        minimumSize: const Size(120, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProfHomePage(),
  ));
}
