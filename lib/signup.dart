import 'package:firebase/app/fire_auth.dart';
import 'package:firebase/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage= "";
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 60),

              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Sign up to get started and enjoy the experience.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 40),

              customTextField(
                controller: usernameController,
                hint: "Username",
              ),

              const SizedBox(height: 16),

              customTextField(
                controller: emailController,
                hint: "E-mail",
              ),

              const SizedBox(height: 16),

              customTextField(
                controller: passwordController,
                hint: "Password",
                isPassword: true,
              ),

              const SizedBox(height: 20),
              if (errorMessage.isNotEmpty)
            Align(
            alignment: Alignment.centerLeft,
            child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.redAccent),
    ),
  ), SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () async{ try{
                    await authservices.value.createAccount(email: emailController.text.trim(), password: passwordController.text.trim(), username: usernameController.text.trim());
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(),));
                  }  on FirebaseAuthException catch(e) {
                    setState(() {
                      errorMessage= e.message ?? "there is an error";
                    });
                  }     },   
                                                                //takes u home will do laterr after the logic
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: Colors.black,
                      overlayColor: Colors.transparent,
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextField({
    required TextEditingController controller,
    required String hint,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? isPasswordHidden : false,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF2F2F2),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordHidden
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
              )
            : null,
      ),
    );
  }
}