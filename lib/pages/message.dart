import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Color(0xff34a1c8),
          ),
        ),
        title: const Center(
          child: Text(
            'Message',
            style: TextStyle(color: Color(0xff184973), fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            width: 510,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffc82c9a),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  width: 40,
                  height: 40,
                  child: const Center(
                    child: Text(
                      'TJ',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text('ToYou Promotions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Spacer(),
                const Text('Feb 8,2023', style: TextStyle(color: Colors.grey, fontSize: 10)),
              ]),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            width: 510,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffc82c9a),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: 40,
                  height: 40,
                  child: const Center(child: Text('TJ', style: TextStyle(color: Colors.white, fontSize: 15))),
                ),
                const SizedBox(width: 10),
                const Text('Health and Safety', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Spacer(),
                const Text('Jul 5,2022', style: TextStyle(color: Colors.grey, fontSize: 10)),
              ]),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            width: 510,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffc82c9a),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: 40,
                  height: 40,
                  child: const Center(child: Text('TJ', style: TextStyle(color: Colors.white, fontSize: 15))),
                ),
                const SizedBox(width: 10),
                const Text('استفتاء لعملاء تويو', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Spacer(),
                const Text('Jun 10,2021', style: TextStyle(color: Colors.grey, fontSize: 10)),
              ]),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            width: 510,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffe02e5b),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: 40,
                  height: 40,
                  child: const Center(child: Text('TS', style: TextStyle(color: Colors.white, fontSize: 15))),
                ),
                const SizedBox(width: 10),
                const Text('ToYou Support', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Spacer(),
                const Text('Feb 8,2021', style: TextStyle(color: Colors.grey, fontSize: 10)),
              ]),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff00b0e1),
              shape: const StadiumBorder(),
              minimumSize: const Size(460, 55),
            ),
            child: const Text(
              'New Message',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
