import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (isLoading)
            Container(
              width: 50,
              height: 50,
              constraints: const BoxConstraints(maxWidth: 50, maxHeight: 50),
              child: const CircularProgressIndicator(color: Color(0xff59d8ed)),
            ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Welcome',
            style: TextStyle(color: Color(0xff184973), fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 230, 226, 226),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            width: 390,
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Email', border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 230, 226, 226),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            width: 390,
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: 'Password', border: InputBorder.none),
                obscureText: true,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              final email = emailController.text;
              final password = passwordController.text;
              setState(() {
                isLoading = true;
              });
              try {
                final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                Navigator.pop(context);
              } catch (error) {
                print(error);
              }
              setState(() {
                isLoading = false;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff00b0e1),
              shape: const StadiumBorder(),
              minimumSize: const Size(400, 55),
            ),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 70, top: 10, right: 70),
            child: Text('By tapping on Continue,you confirm that you have read,'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90, right: 70),
            child: Row(
              children: const [
                Text('Understood, and agreed to our'),
                SizedBox(
                  width: 2,
                ),
                Text(
                  'Terms and conditions',
                  style: TextStyle(color: Color(0xff59d8ed)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 180, right: 150),
            child: Row(
              children: const [
                Text('and '),
                Text(
                  'Privacy policy',
                  style: TextStyle(color: Color(0xff59d8ed)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
