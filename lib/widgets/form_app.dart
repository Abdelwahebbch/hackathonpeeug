import 'package:flutter/material.dart';

class IdeaForm extends StatelessWidget {
  const IdeaForm({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final ideaController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Champ du nom
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Nom',
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Champ de l’idée
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
        ],
      ),
    );
  }
}
