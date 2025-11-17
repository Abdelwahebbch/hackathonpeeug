import 'package:flutter/material.dart';
import 'package:hackathonpeeug/widgets/plan_widget.dart';

class ShowPlans extends StatelessWidget {
  const ShowPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nos offres',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0891B2),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              PlanModal(
                name: "Free",
                price: "0 TND",
                benifs: [
                  const BenefitItem(
                    icon: Icons.check_circle_rounded,
                    text: "Accès illimité à Tawassol",
                  ),
                  const BenefitItem(
                    icon: Icons.lightbulb_circle,
                    text: "Accès à 10 opportunités par jour",
                  ),
                  const BenefitItem(
                    icon: Icons.business_center_rounded,
                    text: "Une brève description des structures",
                  ),
                  const BenefitItem(
                    icon: Icons.support_agent,
                    text: "utilisation limité du Chatbot",
                  ),
                ],
                onPressed: () {},
              ),
              SizedBox(width: 5),
              PlanModal(
                name: "Premium",
                price: "30 TND / 1000 pts",
                benifs: [
                  const BenefitItem(
                    icon: Icons.check_circle_rounded,
                    text: "Toutes les offres du plan gratuit",
                  ),
                  const BenefitItem(
                    icon: Icons.lightbulb_circle,
                    text: "Accès à toutes les opportunités disponibles",
                  ),
                  const BenefitItem(
                    icon: Icons.business_center_rounded,
                    text: "Descriptions détaillées des structures + Contact ",
                  ),
                  const BenefitItem(
                    icon: Icons.speed,
                    text: "Envoyez votre idée instantanément",
                  ),
                  const BenefitItem(
                    icon: Icons.support_agent,
                    text: "Chatbot pour réponses immédiates",
                  ),
                ],
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
