import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathonpeeug/screens/reusable_widgets.dart';
import 'package:hackathonpeeug/screens/splash_screen.dart';
import '../theme/app_theme.dart';
import '../widgets/failure_message.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  bool _connectIssue = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _connectIssue = false;
      });

      try {
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _pwdController.text.trim(),
        );

        if (mounted && _auth.currentUser != null) {
          //TODO load data
          final data = await UserService().getUserData();
          if (!mounted) return;
          Navigator.pushReplacementNamed(context, '/home', arguments: data);
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            _connectIssue = true;
            _isLoading = false;
          });
        }
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            setState(() {
              _connectIssue = false;
            });
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 60),
                    Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset("images/logo.png"),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Tawassol',
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textColor,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Connectez-vous à votre compte entrepreneur',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: AppTheme.textColor.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Champ Email
                          buildInputField(
                            controller: _emailController,
                            label: 'Email',
                            hint: 'Veuillez saisir votre adresse e-mail',
                            icon: Icons.email,
                            keyboardType: TextInputType.emailAddress,

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez saisir votre adresse e-mail';
                              }
                              return null;
                            },
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  color: AppTheme.textColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 20),
                          buildInputField(
                            controller: _pwdController,
                            label: 'Mot de passe ',
                            hint: 'Entrez votre mot de passe',
                            icon: Icons.security,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.characters,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Entrez votre mot de passe';
                              }
                              return null;
                            },
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  color: AppTheme.textColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),

                          const SizedBox(height: 32),

                          ElevatedButton(
                            onPressed: _isLoading ? null : _handleLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: _isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : Text(
                                    'Se connecter',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
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
            ),
          ),
          if (_connectIssue)
            FailureMessage(message: "You Dont have an Account !"),
        ],
      ),
    );
  }
}
