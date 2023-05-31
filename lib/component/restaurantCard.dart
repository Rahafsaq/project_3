import 'package:flutter/material.dart';
import 'package:project_3/pages/menu.dart';

import '../model/restaurant.dart';

class RestaurantCard extends StatefulWidget {
  const RestaurantCard({super.key, required this.restaurant});
  final Restaurant restaurant;
  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final navigator = Navigator.of(context);
        navigator.push(
          MaterialPageRoute(
            builder: (context) => Menu(
              restaurant: widget.restaurant,
            ),
          ),
        );
      },
      child: Container(
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12))),
          width: 450,
          height: 300,
          clipBehavior: Clip.hardEdge,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.network(widget.restaurant.imageUrl, width: 450, height: 200, fit: BoxFit.cover),
            Padding(
                padding: const EdgeInsets.all(12),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Text(widget.restaurant.name,
                        style: const TextStyle(color: Color(0xff184973), fontSize: 20, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    const Icon(Icons.favorite_border_outlined, color: Color(0xff59d8ed))
                  ]),
                  const SizedBox(height: 10),
                  Row(children: [
                    Container(
                        decoration: const BoxDecoration(
                            border: Border.fromBorderSide(BorderSide(color: Color.fromARGB(255, 231, 231, 231)))),
                        child: Row(children: [
                          const Icon(Icons.star, size: 15, color: Color(0xff7ec789)),
                          const SizedBox(width: 4),
                          Text(widget.restaurant.rate, style: const TextStyle(color: Color(0xff184973))),
                          const SizedBox(width: 2)
                        ])),
                    const SizedBox(width: 4),
                    Container(
                        decoration: const BoxDecoration(
                            border: Border.fromBorderSide(BorderSide(color: Color.fromARGB(255, 231, 231, 231)))),
                        child: Row(children: [
                          const Icon(Icons.access_time_outlined, size: 15, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(widget.restaurant.time, style: const TextStyle(color: Color(0xff184973))),
                          const SizedBox(width: 2)
                        ])),
                    const SizedBox(width: 4),
                    Container(
                        decoration: const BoxDecoration(
                            border: Border.fromBorderSide(BorderSide(color: Color.fromARGB(255, 231, 231, 231)))),
                        child: Row(children: [
                          const Icon(Icons.near_me_outlined, size: 15, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(widget.restaurant.destination, style: const TextStyle(color: Color(0xff184973))),
                          const SizedBox(width: 2)
                        ]))
                  ])
                ]))
          ])),
    );
  }
}
