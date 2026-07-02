import 'package:firebase/app/fire_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: const Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Reset your password",
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 10),

            const Text(
              "Enter your email and we'll send you a reset link.",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
               onPressed: () async {
  try {
    await authservices.value.resetPassword(
      email: emailController.text.trim(),
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password reset email sent! Check your inbox"),
      ),
    );

  } catch (e) {
    String message = "Something went wrong. Please try again.";

    if (e.toString().contains('user-not-found')) {
      message = "No account found with this email.";
    } else if (e.toString().contains('invalid-email')) {
      message = "Please enter a valid email address.";
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Send Reset Link",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}