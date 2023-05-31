import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_3/pages/homePage.dart';
import 'package:project_3/pages/message.dart';
import 'package:project_3/pages/more.dart';
import 'package:project_3/pages/trackOrder.dart';
import 'package:project_3/pages/wallet.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
      const TrackOrder(),
      const Wallet(),
      const Message(),
      const More(),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_mall_outlined,
              color: Color(0xff184973),
            ),
            label: 'Shopping',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.drive_eta_outlined,
              color: Color(0xff184973),
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.wallet_sharp,
                color: Color(0xff184973),
              ),
              label: 'Wallet'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_outlined,
              color: Color(0xff184973),
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
              color: Color(0xff184973),
            ),
            label: 'More',
          ),
        ],
        onTap: (newIndex) {
          currentIndex = newIndex;
          setState(() {});
          log(currentIndex.toString());
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
