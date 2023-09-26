import 'package:flutter/material.dart';

class CreerPage extends StatefulWidget {
  const CreerPage({super.key});

  @override
  _CreerPageState createState() => _CreerPageState();
}

class _CreerPageState extends State<CreerPage> {
  final _formKey = GlobalKey<FormState>();

  String? _idErrorText;
  String? _nomErrorText;
  String? _prenomErrorText;
  String? _emailErrorText;
  String? _telErrorText;
  String? _adresseErrorText;
  String? _typeUtilisateurErrorText;
  String? _loginErrorText;
  String? _passwordErrorText;

  String? _selectedTypeUtilisateur;
  List<Widget> _additionalFields = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un Compte'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Création de Compte',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    labelText: 'ID',
                    prefixIcon: Icons.person,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer un ID';
                      }
                      return null;
                    },
                    errorText: _idErrorText,
                  ),
                  _buildTextField(
                    labelText: 'Nom',
                    prefixIcon: Icons.person,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer un nom';
                      }
                      return null;
                    },
                    errorText: _nomErrorText,
                  ),
                  _buildTextField(
                    labelText: 'Prénom',
                    prefixIcon: Icons.person,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer un prénom';
                      }
                      return null;
                    },
                    errorText: _prenomErrorText,
                  ),
                  _buildTextField(
                    labelText: 'Email',
                    prefixIcon: Icons.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer une adresse email';
                      }
                      // Ajoutez ici une validation d'email plus avancée si nécessaire.
                      return null;
                    },
                    errorText: _emailErrorText,
                  ),
                  _buildTextField(
                    labelText: 'Numéro de téléphone',
                    prefixIcon: Icons.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer un numéro de téléphone';
                      }
                      // Ajoutez ici un code de validation du numéro de téléphone si nécessaire.
                      return null;
                    },
                    errorText: _telErrorText,
                  ),
                  _buildTextField(
                    labelText: 'Adresse',
                    prefixIcon: Icons.location_on,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer une adresse';
                      }
                      return null;
                    },
                    errorText: _adresseErrorText,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Type d\'utilisateur',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    items: <String>[
                      'Étudiant',
                      'Professeur',
                      'Responsable Pédagogique'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _selectedTypeUtilisateur,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedTypeUtilisateur = value;
                        _additionalFields = _buildAdditionalFields(value);
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Veuillez sélectionner un type d\'utilisateur';
                      }
                      return null;
                    },
                  ),
                  if (_additionalFields.isNotEmpty) ..._additionalFields,
                  _buildTextField(
                    labelText: 'Login',
                    prefixIcon: Icons.person_outline,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer un login';
                      }
                      return null;
                    },
                    errorText: _loginErrorText,
                  ),
                  _buildTextField(
                    labelText: 'Mot de Passe',
                    prefixIcon: Icons.lock,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer un mot de passe';
                      }
                      // Ajoutez ici des règles de validation du mot de passe si nécessaire.
                      return null;
                    },
                    errorText: _passwordErrorText,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Toutes les validations sont passées
                        // Gérez l'enregistrement du compte ici
                      }
                    },
                    child: const Text('Enregistrer'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required IconData prefixIcon,
    bool obscureText = false,
    required String? Function(String?) validator,
    String? errorText,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorText: errorText,
        ),
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }

  List<Widget> _buildAdditionalFields(String? selectedType) {
    switch (selectedType) {
      case 'Étudiant':
        return [
          _buildTextField(
            labelText: 'Matricule',
            prefixIcon: Icons.confirmation_number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer un matricule';
              }
              return null;
            },
          ),
          _buildTextField(
            labelText: 'Classe',
            prefixIcon: Icons.class_,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer une classe';
              }
              return null;
            },
          ),
          _buildTextField(
            labelText: 'Filière',
            prefixIcon: Icons.school,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer une filière';
              }
              return null;
            },
          ),
        ];
      case 'Professeur':
        return [
          _buildTextField(
            labelText: 'Domaine',
            prefixIcon: Icons.domain,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer un domaine';
              }
              return null;
            },
          ),
          _buildTextField(
            labelText: 'Cours Enseignés',
            prefixIcon: Icons.menu_book,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer des cours enseignés';
              }
              return null;
            },
          ),
        ];
      case 'Responsable Pédagogique':
        return [
          _buildTextField(
            labelText: 'Fonction',
            prefixIcon: Icons.work,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer une fonction';
              }
              return null;
            },
          ),
        ];
      default:
        return [];
    }
  }
}
