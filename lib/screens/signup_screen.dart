import 'package:flutter/material.dart';
import 'package:sprints_task/screens/shopping_home_screen.dart';

import '../l10n/app_localizations.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (c) => AlertDialog(
          content: Text(loc.accountCreated),
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
      appBar: AppBar(title: Text(loc.signUp)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextField(
                controller: _nameController,
                label: loc.fullName,
                validator: (v) {
                  if (v == null || v.isEmpty) return loc.requiredField;
                  if (v[0] != v[0].toUpperCase()) {
                    return loc.firstLetterUppercase;
                  }
                  return null;
                },
              ),
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
              CustomTextField(
                controller: _confirmController,
                label: loc.confirmPassword,
                isPassword: true,
                validator: (v) {
                  if (v != _passController.text) {
                    return loc.passwordsDoNotMatch;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submit(context),
                child: Text(loc.signUp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
