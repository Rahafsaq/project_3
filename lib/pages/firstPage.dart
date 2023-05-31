import 'package:flutter/material.dart';
import 'package:project_3/pages/login.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.network(
              'https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/df/7e/80/df7e80bc-e733-dc6a-2bcc-26694784bf15/AppIcon-0-0-1x_U007emarketing-0-5-0-0-85-220.png/434x0w.webp',
              width: 500,
              height: 400,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const Login()),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff00b0e1),
                shape: const StadiumBorder(),
                minimumSize: const Size(400, 55),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Continue as guest',
              style: TextStyle(color: Color(0xff00b0e1), decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
    );
  }
}
