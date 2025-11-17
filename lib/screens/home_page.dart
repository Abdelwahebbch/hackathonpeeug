import 'package:flutter/material.dart';
import 'package:hackathonpeeug/screens/profile_screen.dart';
import 'package:hackathonpeeug/static_opp/premium_opp_view.dart';
import '../widgets/introduction_card.dart';
import '../widgets/structure_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<Map<String, String>> opps = <Map<String, String>>[
    {
      "name": "Flat6Labs Tunis",
      "shortDesc": "Accélérateur seed & early-stage",
      "longDescripton":
          "Flat6Labs est un accélérateur de startups opérant en Tunisie, fournissant du financement, du mentorat, un espace de coworking ainsi que des programmes d’accélération spécialisés. Ils accompagnent des projets innovants en phase d’amorçage.",
      "services": "Mentorat, financement seed, espace de travail, formation",
      "contact": "contact@flat6labs.tn",
      "path": "/flat6labs",
    },
    {
      "name": "StartupGateX",
      "shortDesc": "Venture studio / Startup Studio",
      "longDescripton":
          "StartupGateX est un studio-accélérateur hybride qui aide les startups à développer leur MVP, lever des fonds et accéder à un réseau international. Ils ont une forte présence en Afrique et au Moyen-Orient. :contentReference[oaicite:0]{index=0}",
      "services":
          "Construction de MVP, conseils techniques, levée de fonds, studio",
      "contact": "contact@startupgatex.org",
      "path": "/startupgatex",
    },
    {
      "name": "CEED Tunisie",
      "shortDesc": "Organisation non‑gouvernementale d’entrepreneuriat",
      "longDescripton":
          "CEED Tunisia soutient les entrepreneurs à fort potentiel à travers du mentorat, des ateliers, des programmes de croissance et un réseau d’experts et d’investisseurs. :contentReference[oaicite:1]{index=1}",
      "services": "Mentorat, coaching, réseau d'investisseurs, formation",
      "contact": "ceed.tunisia@example.com",
      "path": "/ceed-tunisia",
    },
    {
      "name": "CoStarT Sfax",
      "shortDesc": "Incubateur technologique régional",
      "longDescripton":
          "CoStarT est l’incubateur du Technopôle de Sfax, dédié au développement de startups dans le digital et la recherche scientifique, avec un accompagnement adapté aux projets technologiques. :contentReference[oaicite:2]{index=2}",
      "services": "Incubation, coworking, mentorat, soutien R&D",
      "contact": "costart.sfax@example.com",
      "path": "/costart-sfax",
    },
    {
      "name": "Lab’Ess",
      "shortDesc": "Incubateur d’entrepreneuriat social",
      "longDescripton":
          "Lab’Ess soutient les entreprises sociales et les entrepreneurs à impact dans leurs phases de création et de développement. Ils offrent un écosystème pour les projets durables et à impact social. :contentReference[oaicite:3]{index=3}",
      "services":
          "Incubation sociale, formation, réseautage, financement à impact",
      "contact": "labess.tn@example.com",
      "path": "/labess",
    },
    {
      "name": "I‑StartUp",
      "shortDesc": "Coaching + Développement MVP",
      "longDescripton":
          "I‑StartUp accompagne les jeunes startups en les aidant à développer leur MVP (produit minimum viable) grâce à une équipe technique dédiée, tout en fournissant des conseils entrepreneuriaux. :contentReference[oaicite:4]{index=4}",
      "services": "Développement produit, mentorat, accompagnement technique",
      "contact": "info@i-startup.tn",
      "path": "/i-startup",
    },
    {
      "name": "TunisianStartups",
      "shortDesc": "Communauté & Think Tank",
      "longDescripton":
          "TunisianStartups est une ONG qui met en relation les entrepreneurs, organise des événements, milite pour des politiques publiques favorables aux startups et propose des ressources pour le développement d’écosystèmes. :contentReference[oaicite:5]{index=5}",
      "services":
          "Réseautage, plaidoyer, formation, communauté d’entrepreneurs",
      "contact": "contact@tunisian-startups.com",
      "path": "/tunisian-startups",
    },
    {
      "name": "Technopark ElGhazala",
      "shortDesc": "Technoparc & incubateur",
      "longDescripton":
          "Le Technopark ElGhazala est un parc technologique dédié aux startups et aux entreprises innovantes. Il offre des infrastructures, des bureaux, un accompagnement et une connexion aux investisseurs. :contentReference[oaicite:6]{index=6}",
      "services":
          "Bureaux, coworking, réseau d’affaires, soutien institutionnel",
      "contact": "info@technopark-elizghala.tn",
      "path": "/technopark-elagazala",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      backgroundColor: Colors.grey[300],
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.home_outlined,
                  color: Color(0xFF0891B2),
                ),
                title: const Text('Accueil'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.person_outline,
                  color: Color(0xFF0891B2),
                ),
                title: const Text('Mon Profil'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.info_outline,
                  color: Color(0xFF0891B2),
                ),
                title: const Text('À propos'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/about');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.rocket_launch,
                  color: Color(0xFF0891B2),
                ),
                title: const Text('Upgrade Your Experience !'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/plans');
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Déconnexion'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF0891B2),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _scaffoldKey.currentState?.openDrawer();
                              },
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    'Tawassol',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Text(
                                  'Opportunity\'s Space ',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: Colors.white.withValues(
                                          alpha: 0.8,
                                        ),
                                      ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        IntoductionCard(),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'les opportunités suggérées  ',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF4B5563),
                              ),
                        ),
                      ),
                      Expanded(
                        child: opps.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: opps.length,
                                itemBuilder: (context, index) {
                                  return StructureInfo(
                                    structname: opps[index]["name"]!,
                                    structShortDisc: opps[index]["shortDesc"]!,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder:
                                              (
                                                context,
                                                animation,
                                                secondaryAnimation,
                                              ) => PremiumOppView(
                                                structName:
                                                    opps[index]["name"]!,
                                                longDescripton:
                                                    opps[index]["longDescripton"]!,
                                                services:
                                                    opps[index]["services"]!,
                                                contact:
                                                    opps[index]["contact"]!,
                                              ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              )
                            : Center(child: Text("No Item Found ! ")),
                      ),

                      // SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.question_answer),
        onPressed: () {
          Navigator.pushNamed(context, '/chatbot');
        },
      ),
    );
  }
}
