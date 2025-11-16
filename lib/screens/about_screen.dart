import 'package:flutter/material.dart';
import 'reusable_widgets.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'À propos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0891B2),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo et titre de l'app
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
                      Icons.question_mark_sharp,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tawassol',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: const Color(0xFF0891B2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Version 1.0.0',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Description
            buildSection(
              context,
              'Qui sommes-nous ?',
              'Tawasol est une application mobile conçue pour faciliter l’accès à l’information et améliorer la visibilité des services publics et privés en Tunisie. Notre objectif est de rapprocher les citoyens des institutions en leur offrant un outil simple, rapide et accessible à tous, quel que soit leur lieu de résidence ou leur niveau numérique.',
              Icons.info_outline,
            ),

            const SizedBox(height: 24),

            buildSection(
              context,
              'Notre mission',
              'Assurer une relation cohérente et durable avec les futurs entrepreneurs et les structures partenaires, tout en proposant des tarifs abordables',
              Icons.star_outline,
            ),

            const SizedBox(height: 24),

            buildSection(
              context,
              'Contact',
              'Pour toute question, assistance technique ou feedback, veuillez nous contacter à l\'adresse contact@tawassol.org',
              Icons.contact_support_outlined,
            ),

            const SizedBox(height: 24),

            buildSection(
              context,
              'notre Equipe',
              '- Abdelwaheb Bouchahwa\n- Majed jadli\n- Ons Alaimi\n- Meniar Ben Rhouma\n- Ahmed Rami Soussi',
              Icons.code_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
