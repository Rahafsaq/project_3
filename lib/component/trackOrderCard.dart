import 'package:flutter/material.dart';

class TrackOrderCard extends StatelessWidget {
  const TrackOrderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 36),
              child: Text(
                'KFC',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            SizedBox(
                width: 60,
                height: 60,
                child: Image.network('https://media-cdn.tripadvisor.com/media/photo-s/1b/99/44/8e/kfc-faxafeni.jpg',
                    fit: BoxFit.cover)),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 36),
              child: Text('zenger', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const Spacer(),
            SizedBox(
                width: 60,
                height: 60,
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR15QA9A6exy-xbhlaBxY38CzYb-mPZsSKcqQ&usqp=CAU',
                    fit: BoxFit.cover)),
          ],
        ),
      ],
    );
  }
}
