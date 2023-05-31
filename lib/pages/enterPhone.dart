import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_3/pages/verification.dart';

class EnterPhone extends StatelessWidget {
  const EnterPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xff59d8ed), fontSize: 16),
            ),
          ),
        ),
        title: const Center(
          child: Text(
            'Enter ToYou',
            style: TextStyle(color: Color(0xff184973), fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Phone number',
              style: TextStyle(color: Colors.grey),
            ),
            Row(
              children: [
                Image.network(
                    'data:image/png;base64,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',
                    width: 40,
                    height: 40),
                const SizedBox(
                  width: 4,
                ),
                const Text('+966'),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Color(0xff7bc5e7),
                ),
                SizedBox(
                    width: 350,
                    height: 20,
                    child: TextField(
                        decoration: const InputDecoration(labelText: 'Enter Number'),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly])),
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const Verification()),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff00b0e1),
                  shape: const StadiumBorder(),
                  minimumSize: const Size(400, 55),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 70, top: 10, right: 70),
              child: Text('By tapping on Continue,you confirm that you have read,'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                children: const [
                  Text('Understood, and agreed to our'),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Terms and conditins',
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
      ),
    );
  }
}
