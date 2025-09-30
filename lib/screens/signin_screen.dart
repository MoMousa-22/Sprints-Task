import 'package:flutter/material.dart';
import 'package:sprints_task/screens/shopping_home_screen.dart';

import '../l10n/app_localizations.dart';
import '../widgets/custom_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (c) => AlertDialog(
          content: Text(loc.accountSignedIn),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(c).pop();
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 800),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const ShoppingHomeScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                  ),
                );
              },
              child: Text(loc.close),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.signIn)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextField(
                controller: _emailController,
                label: loc.email,
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.isEmpty) return loc.requiredField;
                  if (!v.contains('@')) return loc.mustIncludeAt;
                  return null;
                },
              ),
              CustomTextField(
                controller: _passController,
                label: loc.password,
                isPassword: true,
                validator: (v) {
                  if (v == null || v.isEmpty) return loc.requiredField;
                  if (v.length < 6) return loc.passwordMinLength;
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submit(context),
                child: Text(loc.signIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
