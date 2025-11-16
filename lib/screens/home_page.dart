import 'package:flutter/material.dart';
import 'package:hackathonpeeug/screens/profile_screen.dart';
import '../widgets/introduction_card.dart';
import '../widgets/quick_actions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int balance = 10;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,

        backgroundColor: Colors.grey[300],
        drawer: Drawer(
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
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
                          IntoductionCard(balance: balance),
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
                        QuickActions(
                          onOppPressedMethod: () {
                            Navigator.pushNamed(context, '/opp1');
                          },
                        ),
                        QuickActions(
                          onOppPressedMethod: () {
                            Navigator.pushNamed(context, '/opp2');
                          },
                        ),
                        QuickActions(
                          onOppPressedMethod: () {
                            Navigator.pushNamed(context, '/opp3');
                          },
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
      ),
    );
  }
}
