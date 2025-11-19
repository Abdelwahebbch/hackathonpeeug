import 'package:flutter/material.dart';
import 'package:hackathonpeeug/models/stat_data.dart';
import 'package:hackathonpeeug/screens/profile_screen.dart';
import 'package:hackathonpeeug/static_opp/premium_opp_view.dart';
import 'package:hackathonpeeug/widgets/failure_message.dart';
import '../widgets/introduction_card.dart';
import '../widgets/structure_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showPlanError = false;

  void showPlanErrorFunc() {
    setState(() {
      _showPlanError = true;
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showPlanError = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context)!.settings.arguments as Map?;
    debugPrint("${userData?['Nom']} + HomePage");
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
                  Navigator.pushNamed(context, '/profile', arguments: userData);
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
                                Navigator.pushNamed(
                                  context,
                                  '/profile',
                                  arguments: userData,
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
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: structures.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: userData?["Plan"] == "Free"
                                    ? 10
                                    : structures.length,
                                itemBuilder: (context, index) {
                                  return StructureInfo(
                                    showPaiment: showPlanErrorFunc,
                                    structname: structures[index].name,
                                    structShortDisc:
                                        structures[index].shortDesc,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PremiumOppView(
                                            structName: structures[index].name,
                                            longDescription: structures[index]
                                                .longDescription,
                                            services:
                                                structures[index].services,
                                            contact: structures[index].contact,
                                          ),
                                        ),
                                      );
                                    },
                                    isPremium: userData?['Plan'] == "Free"
                                        ? false
                                        : true,
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
          if (_showPlanError) FailureMessage(message: "Buy Premium"),
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
