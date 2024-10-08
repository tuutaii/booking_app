import 'package:booking_home_app/components/common_textfield.dart';
import 'package:booking_home_app/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Your Account',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CommonTextField(
              labelText: 'Your name',
              hintText: 'Enter your  name',
              prefixIcon: Icons.person,
            ),
            const CommonTextField(
              labelText: 'Phone number',
              hintText: 'Enter your phone number',
              prefixIcon: Icons.phone,
            ),
            const CommonTextField(
              labelText: 'Email',
              hintText: 'Enter your email',
              prefixIcon: Icons.email,
            ),
            const CommonTextField(
              labelText: 'Password',
              hintText: 'Enter your password',
              prefixIcon: Icons.lock,
            ),
            const CommonTextField(
              labelText: 'Confirm Password',
              hintText: 'Enter your password again',
              prefixIcon: Icons.lock,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle account creation logic here
              },
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Create Account',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Or sign up with'),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialLoginButton(icon: Icons.social_distance),
                SocialLoginButton(icon: Icons.facebook),
                SocialLoginButton(icon: Icons.apple),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Already have an account?'),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text('Login',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final IconData icon;

  const SocialLoginButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      child: Icon(icon),
    );
  }
}
