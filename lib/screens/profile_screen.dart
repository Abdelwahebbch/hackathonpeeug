import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/entrepreneur_model.dart';
import 'reusable_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Student? student;
  bool isLoading = true;

  /// Fetch student data from Firestore
  Future<Student?> fetchStudent() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) return null;

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();
      if (!doc.exists) return Student.emptyStudent();

      return Student.fromFireStore(doc.data()!);
    } catch (e) {
      debugPrint("Error fetching student: $e");
      return null;
    }
  }

  /// Load student when screen starts
  @override
  void initState() {
    super.initState();
    loadStudent();
  }

  Future<void> loadStudent() async {
    setState(() => isLoading = true);
    final fetchedStudent = await fetchStudent();
    setState(() {
      student = fetchedStudent;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final userName = student?.name ?? "Not Available!";
    final userCin = student?.cin ?? "Not Available";
    final nomPole = student?.nomPole ?? "Not Available";
    final finTotale = student?.finTotale ?? "Not Available";
    final score = student?.score ?? "Not Available";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF0891B2),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Mon Profil',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.grey[500],
                          size: 50,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        userName,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Info Section
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  buildInfoSection(context, 'Informations Personnelles', [
                    buildInfoItem(context, 'CIN', userCin, Icons.credit_card),
                    buildInfoItem(
                      context,
                      'Nom du pôle',
                      nomPole,
                      Icons.school,
                    ),
                  ]),
                  const SizedBox(height: 32),
                  buildInfoSection(context, 'Statistiques', [
                    buildInfoItem(
                      context,
                      'Score',
                      '$score points',
                      Icons.score,
                    ),
                    buildInfoItem(
                      context,
                      'Financement total',
                      '$finTotale millimes',
                      Icons.account_balance_wallet,
                    ),
                  ]),
                  const SizedBox(height: 32),

                  // Logout Button
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFFEC4899),
                        width: 2,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        if (mounted) {
                          Navigator.pushReplacementNamed(context, '/login');
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.logout, color: Color(0xFFEC4899)),
                          const SizedBox(width: 8),
                          Text(
                            'Se déconnecter',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: const Color(0xFFEC4899),
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
