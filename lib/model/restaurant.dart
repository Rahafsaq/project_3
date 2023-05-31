class Restaurant {
  final String id;
  final String imageUrl;
  final String name;
  final String rate;
  final String time;
  final String destination;

  const Restaurant({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.rate,
    required this.time,
    required this.destination,
  });

  @override
  String toString() {
    return 'Restaurant $id  $imageUrl $name $rate $time $destination';
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      imageUrl: map['imageUrl'],
      name: map['name'],
      rate: map['rate'],
      time: map['time'],
      destination: map['destination'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'rate': rate,
      'time': time,
      'destination': destination,
    };
  }
}

class Data {
  static final List<Restaurant> restaurant = [
    const Restaurant(
      id: '1',
      imageUrl: 'https://www.foodtodayeg.com/Content/Upload/large/320222217122179977672.jpg',
      name: 'McDonalds',
      rate: '4.3',
      time: '30-36 min',
      destination: '1.4 km',
    ),
    const Restaurant(
      id: '2',
      imageUrl: 'https://pbs.twimg.com/media/Fdqy-ozXoAENflj?format=jpg&name=large',
      name: 'ULB',
      rate: '4.7',
      time: '35-40 min',
      destination: '4.4 km',
    ),
    const Restaurant(
      id: '3',
      imageUrl: 'https://media-cdn.tripadvisor.com/media/photo-s/1b/99/44/8e/kfc-faxafeni.jpg',
      name: 'KFC',
      rate: '3.7',
      time: '20-40 min',
      destination: '2.4 km',
    ),
    const Restaurant(
      id: '4',
      imageUrl: 'https://img.grouponcdn.com/deal/YBu4bbMWrhzvkjV4D3zyYagGbZr/YB-1500x900/v1/c870x524.jpg',
      name: 'Tim Hortons',
      rate: '4.2',
      time: '20-30 min',
      destination: '0.9 km',
    ),
    const Restaurant(
      id: '5',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-2371118-1499433515.jpg?crop=1xw:0.7790858725761773xh;center,top&resize=1200:*',
      name: 'Starbucks',
      rate: '4.8',
      time: '20-30 min',
      destination: '2.9 km',
    ),
    const Restaurant(
      id: '6',
      imageUrl:
          'https://1.bp.blogspot.com/-T2xd4Zz90Oo/YQF8nbecG6I/AAAAAAAAW7U/IXpVnJJGAgACMo2MY22Gw775RB2rnoERwCLcBGAsYHQ/s16000/%25D8%25B3%25D9%258A%25D9%2586%25D8%25A7%25D8%25A8%25D9%2588%25D9%2586-%25D8%25A7%25D9%2584%25D8%25AC%25D8%25AF%25D9%258A%25D8%25AF%25D8%25A9.jpg',
      name: 'Cinnabon',
      rate: '4.8',
      time: '20-30 min',
      destination: '2.9 km',
    ),
    const Restaurant(
      id: '7',
      imageUrl:
          'https://egypt-menu.com/wp-content/uploads/2022/03/%D8%A3%D8%B3%D8%B9%D8%A7%D8%B1-%D9%85%D9%86%D9%8A%D9%88-%D9%88%D9%81%D8%B1%D9%88%D8%B9-%D9%88%D8%B1%D9%82%D9%85-%D8%AF%D9%84%D9%8A%D9%81%D8%B1%D9%8A-%D8%AF%D8%A7%D9%86%D9%83%D9%86-%D8%AF%D9%88%D9%86%D8%AA%D8%B3-%D9%85%D8%B5%D8%B1.jpg',
      name: 'Danken Donuts',
      rate: '4.8',
      time: '25-30 min',
      destination: '1.9 km',
    ),
    const Restaurant(
      id: '8',
      imageUrl:
          'https://assets.simpleviewinc.com/simpleview/image/upload/crm/batonrouge/All-things-BR-3cc3e0f95056b36_3cc3e1fc-5056-b365-aba6370df44cb3bc.jpg',
      name: 'Baskin Robbins',
      rate: '3.8',
      time: '25-30 min',
      destination: '0.7 km',
    ),
    const Restaurant(
      id: '9',
      imageUrl:
          'https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_1200,q_auto:low,fl_lossy,dpr_2.0,c_fill,f_auto,h_800,g_auto/kwijbfsr8yvr6oigppwc',
      name: 'Pizza Hut',
      rate: '4.5',
      time: '25-30 min',
      destination: '6.7 km',
    ),
  ];
  static final List<Restaurant> cart = [];
  static final List<Restaurant> checkout = [];
}
