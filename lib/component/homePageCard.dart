import 'package:flutter/material.dart';
import 'package:project_3/pages/allRestaurants.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 40, top: 10),
            child: Text(
              'NEW',
              style: TextStyle(color: Color(0xff71cfca), fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff15e4de),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        width: 120,
                        height: 100,
                        child: const Center(child: Text('Club', style: TextStyle(color: Colors.white, fontSize: 20))),
                      ),
                      const Text(
                        'ToYou Club',
                        style: TextStyle(color: Color(0xff184973), fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff15e4de),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        width: 120,
                        height: 100,
                        child: const Center(child: Icon(Icons.wallet_outlined, size: 50, color: Colors.white)),
                      ),
                      const Text(
                        'ToYou Credit',
                        style: TextStyle(color: Color(0xff184973), fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff15e4de),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        width: 120,
                        height: 100,
                        child: const Center(
                          child: Icon(Icons.repeat_on_outlined, size: 50, color: Colors.white),
                        ),
                      ),
                      const Text(
                        'Order Agian',
                        style: TextStyle(color: Color(0xff184973), fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              'ALWAYS AT YOUR SERVICE',
              style: TextStyle(color: Color(0xff71cfca), fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10, right: 15),
            child: InkWell(
              onTap: () {
                final navigator = Navigator.of(context);
                navigator.push(
                  MaterialPageRoute(
                    builder: (context) => const AllRestaurants(),
                  ),
                );
              },
              child: Image.network(
                'https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/df/7e/80/df7e80bc-e733-dc6a-2bcc-26694784bf15/AppIcon-0-0-1x_U007emarketing-0-5-0-0-85-220.png/434x0w.webp',
                width: 450,
                height: 150,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              'All Restaurants & Stores',
              style: TextStyle(color: Color(0xff184973), fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
