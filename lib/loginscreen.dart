import 'package:firebase/app/fire_auth.dart';
import 'package:firebase/forgotpassword.dart';
import 'package:firebase/homepage.dart';
import 'package:firebase/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController EmailController = TextEditingController();
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
                "Welcome back!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Access your account and continue your journey with ease and confidence.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40),
              customTextField(
                controller: EmailController,
                hint: "E-mail",
              ),
              const SizedBox(height: 16),
              customTextField(
                controller: passwordController,
                hint: "Password",
                isPassword: true,
              ),
              const SizedBox(height: 10),
              Align(
  alignment: Alignment.centerRight,
  child: TextButton(
    onPressed: () async {
      await authservices.value.resetPassword(
        email: EmailController.text.trim(),
      ); Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
    },
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      foregroundColor: Colors.black,
      overlayColor: Colors.transparent,
    ),
    child: const Text(
      "Forgot Password?",
      style: TextStyle(fontSize: 12),
    ),
  ),
),

const SizedBox(height: 8),

if (errorMessage.isNotEmpty)
  Align(
    alignment: Alignment.center,
    child: Text(
      errorMessage,
      style: const TextStyle(color: Colors.redAccent),
    ),
  ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () 
                  async{
                    try {await authservices.value.signIn(email: EmailController.text.trim(), password: passwordController.text.trim());
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(),));
                    } on FirebaseAuthException catch(e) {
                     setState(() {
                       errorMessage= e.message ?? "There is an error";
                     });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[400])),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Dont have an account?"),
                  ),
                  Expanded(child: Divider(color: Colors.grey[400])),
                ],
              ),
              const SizedBox(height: 20),
              Align(
  alignment: Alignment.center,
  child: TextButton(
    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()
    )
    );
    },
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      foregroundColor: Colors.black,
      overlayColor: Colors.transparent,
    ),
    child: const Text(
      "Sign Up",
      style: TextStyle(fontSize: 16),
    ),
  ),
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