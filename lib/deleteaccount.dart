import 'package:firebase/app/fire_auth.dart';
import 'package:flutter/material.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: const Text("Delete Account"),
        centerTitle: true,
      ), 
      body: 
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "We're sorry to see you go",
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            const Text(
              "Enter your email and password to confirm deletion.",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 25),

            // EMAIL
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // PASSWORD
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
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
    await authservices.value.deleteAccount(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (!mounted) return;

    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
      (route) => false,
    );

  } catch (e) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Failed to delete account. Please check your credentials."),
      ),
    );
  }
},
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Delete Account",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
