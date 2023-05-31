import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_3/pages/profile.dart';

import 'AccountDetails.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xff59d8ed),
          ),
        ),
        title: const Center(
          child: Text(
            'Verification',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff184973),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        const SizedBox(
          height: 40,
        ),
        const Text(
          'A confirmation code has been sent',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'to',
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              '+966 58 163 7771',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              '(Edit)',
              style: TextStyle(
                color: Color(0xff59d8ed),
              ),
            ),
          ],
        ),
        const Text(
          'Please enter it below',
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            TextFieldNum(),
            SizedBox(
              width: 4,
            ),
            TextFieldNum(),
            SizedBox(
              width: 4,
            ),
            TextFieldNum(),
            SizedBox(
              width: 4,
            ),
            TextFieldNum(),
            SizedBox(
              width: 4,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Resending the confirmation code in 01:30',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: () {
            final navigator = Navigator.of(context);
            navigator.push(
              MaterialPageRoute(
                builder: (context) => const AccountDetails(),
              ),
            );
          },
          child: const Text(
            'Done',
            style: TextStyle(
              color: Color(0xff59d8ed),
            ),
          ),
        )
      ]),
    );
  }
}

class TextFieldNum extends StatelessWidget {
  const TextFieldNum({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }
}
