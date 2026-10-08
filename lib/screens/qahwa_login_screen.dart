import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/qahwa/qahwa_components.dart';
import '../utils/validators.dart';

class QahwaLoginScreen extends StatefulWidget {
  const QahwaLoginScreen({super.key});

  @override
  State<QahwaLoginScreen> createState() => _QahwaLoginScreenState();
}

class _QahwaLoginScreenState extends State<QahwaLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logged in as ${_emailController.text}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const Positioned.fill(child: BeansBackground()),
            CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(28, 36, 28, 50),
                          child: AuthHeader(
                            title: 'Smooth Out\nYour Everyday',
                            subtitle: 'Log in to order your favourite cup.',
                          ),
                        ),
                      ),
                      Expanded(child: GreenDome(child: _buildForm())),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(child: DrinkHero()),
          const SizedBox(height: 28),
          PillTextField(
            controller: _emailController,
            hint: 'Email address',
            icon: Icons.mail_outline_rounded,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: Validators.email,
          ),
          const SizedBox(height: 16),
          PasswordField(
            controller: _passwordController,
            onSubmitted: (_) => _login(),
            validator: Validators.password,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          PillButton(label: 'Log In', onTap: _login),
          const SizedBox(height: 28),
          Text(
            'OR CONTINUE WITH',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 11,
              letterSpacing: 0.8,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialButton(icon: FontAwesomeIcons.google, onTap: () {}),
              const SizedBox(width: 20),
              SocialButton(icon: FontAwesomeIcons.apple, onTap: () {}),
              const SizedBox(width: 20),
              SocialButton(icon: FontAwesomeIcons.facebookF, onTap: () {}),
            ],
          ),
          const SizedBox(height: 28),
          Center(
            child: AuthFooterLink(
              text: "Don't have an account?",
              actionText: 'Sign Up',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
