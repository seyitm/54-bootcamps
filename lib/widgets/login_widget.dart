import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback OnclickedSignUp;
  const LoginWidget({Key? key, required this.OnclickedSignUp})
      : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          TextField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: "Email",
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(labelText: "password"),
            obscureText: true,
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)),
              onPressed: signIn,
              icon: const Icon(FontAwesomeIcons.lock),
              label: const Text("Signİn")),
          const SizedBox(
            height: 40,
          ),
          RichText(
            text: TextSpan(
                style: const TextStyle(color: Colors.white, fontSize: 20),
                text: "No account",
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.OnclickedSignUp,
                      text: "Sign Up",
                      style: GoogleFonts.raleway(
                        color: const Color(0xFF26235C),
                      ))
                ]),
          )
        ],
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        builder: ((context) => const Center(
              child: CircularProgressIndicator(),
            )));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
