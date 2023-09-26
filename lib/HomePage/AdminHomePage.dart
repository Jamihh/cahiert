import 'package:flutter/material.dart';
import 'package:cahiert/creerPage.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil de l'administrateur"),
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
              backgroundImage: AssetImage('assets/images/admin.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Bonjour, admin !',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Rechercher un compte',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              // Vous pouvez ajouter ici la logique de recherche si nécessaire.
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    context,
                    'Créer Compte',
                    Icons.add,
                    Colors.green,
                    () {
                      _createAccount(context);
                    },
                  ),
                ),
                SizedBox(width: 20), // Espace entre les boutons
                Expanded(
                  child: _buildCard(
                    context,
                    'Liste de Comptes',
                    Icons.list,
                    Colors.blue,
                    () {
                      _showAccountList(context);
                    },
                  ),
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
    Navigator.pushReplacementNamed(context, '/adminauth');
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
        disabledForegroundColor: color.withOpacity(0.8).withOpacity(0.38),
        disabledBackgroundColor: color.withOpacity(0.8).withOpacity(0.12),
        minimumSize: const Size(120, 40), // Dimensions des boutons
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon,
      Color color, VoidCallback onPressed) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 36,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createAccount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreerPage(),
      ),
    );
  }

  void _showAccountList(BuildContext context) {
    // Vous pouvez ajouter ici le code pour afficher la liste des comptes.
    // Par exemple, vous pouvez naviguer vers une nouvelle page dédiée à la liste des comptes.
  }
}

void main() {
  runApp(const MaterialApp(
    home: AdminHomePage(),
  ));
}
