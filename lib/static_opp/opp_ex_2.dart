import 'package:flutter/material.dart';
import '../screens/reusable_widgets.dart';

class OppEx2 extends StatefulWidget {
  final String structName;
  const OppEx2({super.key, required this.structName});

  @override
  State<OppEx2> createState() => _OppEx2State();
}

class _OppEx2State extends State<OppEx2> {
  bool showForm = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ideaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0891B2),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Stack(
        children: [
          // ---- Contenu principal ----
          SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0891B2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.factory,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.structName,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: const Color(0xFF0891B2),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                buildSection(
                  context,
                  'Description',
                  '--------------------------------------------------------',
                  Icons.info_outline,
                ),
                const SizedBox(height: 24),
                buildSection(
                  context,
                  'Services',
                  '--------------------------------------------------------',
                  Icons.star_outline,
                ),
                const SizedBox(height: 24),
                buildSection(
                  context,
                  'Contact',
                  'Num Tel : 21 123 456 \nEmail : test@contact.org',
                  Icons.contact_support_outlined,
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          showForm = true;
                        });
                      },
                      icon: const Icon(Icons.contact_support),
                      label: const Text("Envoyez votre idée maintenant !"),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Form affiche avec Stack
          if (showForm)
            Container(
              color: Colors.black.withValues(
                alpha: 0.5,
              ), // Fond semi-transparent
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Proposez votre idée 💡",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0891B2),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Votre nom',
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: ideaController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Votre idée',
                          prefixIcon: const Icon(Icons.lightbulb_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                showForm = false;
                              });
                            },
                            child: const Text(
                              "Annuler",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // ici tu peux envoyer à Firestore par exemple
                              debugPrint("Nom: ${nameController.text}");
                              debugPrint("Idée: ${ideaController.text}");

                              setState(() {
                                showForm = false;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Merci pour votre idée !"),
                                  backgroundColor: Color(0xFF0891B2),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0891B2),
                            ),
                            child: const Text("Envoyer"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
