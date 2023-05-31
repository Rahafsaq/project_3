import 'dart:async';

import 'package:flutter/material.dart';

import '../component/homePageCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Timer timer;
  final ImageProvider = [
    Padding(
      padding: const EdgeInsets.all(12),
      child: Image.network(
        'https://pbs.twimg.com/media/FoBbaJsX0AAmWd4?format=jpg&name=900x900',
        key: const Key('1'),
        width: 500,
        height: 250,
        fit: BoxFit.fill,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12),
      child: Image.network(
        'https://pbs.twimg.com/media/FoBb7bOXoAIhy1L?format=jpg&name=900x900',
        key: const Key('2'),
        width: 500,
        height: 250,
        fit: BoxFit.fill,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12),
      child: Image.network(
        'https://pbs.twimg.com/media/FoHOcQZWAAAZqA4?format=jpg&name=900x900',
        key: const Key('3'),
        width: 500,
        height: 250,
        fit: BoxFit.fill,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12),
      child: Image.network(
        'https://pbs.twimg.com/media/FmRAizMWYAAcnAo?format=jpg&name=900x900',
        key: const Key('4'),
        width: 500,
        height: 250,
        fit: BoxFit.fill,
      ),
    ),
  ];
  int index = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() => index++);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'What are you looking to buy?',
            style: TextStyle(color: Color(0xff184973), fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search_outlined,
              color: Color(0xff15e4de),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child: ImageProvider[index % ImageProvider.length],
              ),
              const HomePageCard(),
            ],
          ),
        ],
      ),
      backgroundColor: const Color(0xffedeef2),
    );
  }
}
