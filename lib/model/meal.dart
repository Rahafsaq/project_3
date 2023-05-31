class Meal {
  final String id;
  final String resId;
  final String imageUrl;
  final String name;
  final String price;

  const Meal({required this.id, required this.resId, required this.imageUrl, required this.name, required this.price});

  @override
  String toString() {
    return 'Meal $name $imageUrl $price $resId';
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'],
      resId: map['resId'],
      imageUrl: map['imageUrl'],
      name: map['name'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'resId': resId,
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
    };
  }
}

class Data2 {
  static final List<Meal> meals = [
    const Meal(
      id: '1',
      resId: '1',
      imageUrl: 'https://s7d1.scene7.com/is/image/mcdonalds/mcd-big-tasty-meal-ry-v1:1-4-product-tile-desktop',
      name: 'Big Tasty Chicken',
      price: '28',
    ),
    const Meal(
      id: '2',
      resId: '1',
      imageUrl: 'https://s7d1.scene7.com/is/image/mcdonalds/mcd-spicy-mcchicken-meal-ry-v1:1-4-product-tile-desktop',
      name: 'Grand Chicken Spicy',
      price: '32',
    ),
    const Meal(
      id: '3',
      resId: '1',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTryDzoZ685OPHNfilxCY2vEImxarfcz1Gdng&usqp=CAU',
      name: 'French Fries',
      price: '11',
    ),
    const Meal(
      id: '4',
      resId: '1',
      imageUrl: 'https://s7d1.scene7.com/is/image/mcdonalds/mocha:1-4-product-tile-desktop',
      name: 'Mocha',
      price: '28',
    ),
    const Meal(
      id: '5',
      resId: '1',
      imageUrl: 'https://s7d1.scene7.com/is/image/mcdonalds/twister-toffee-ry-v1:1-4-product-tile-desktop',
      name: 'Toffee twister',
      price: '15',
    ),
    const Meal(
      id: '6',
      resId: '2',
      imageUrl: 'https://pbs.twimg.com/media/FKsvyyDWYAQBucU.jpg',
      name: 'Cheess Burger',
      price: '19',
    ),
    const Meal(
      id: '7',
      resId: '2',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiIYcxxEw75yXMPFRk3-MefxHkPqoBuEfevwvy630ni3wvf3be-gSwXNQ9hGiofDI3FJ8&usqp=CAU',
      name: 'Sauce',
      price: '5',
    ),
    const Meal(
      id: '8',
      resId: '2',
      imageUrl:
          'https://vid.alarabiya.net/images/2022/10/12/5c9c9e3c-9c73-4c8c-a1a8-fc02ab5a0001/5c9c9e3c-9c73-4c8c-a1a8-fc02ab5a0001_16x9_1200x676.JPG',
      name: 'Pepsi',
      price: '4',
    ),
    const Meal(
      id: '9',
      resId: '3',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRetDMZgsafaWC-2FbFdJmWK-_jeNqimW-6DkD6ikPN8nGnTW_a7pEE6rKm3PGxzF0ejcw&usqp=CAU',
      name: 'Family Box',
      price: '80',
    ),
    const Meal(
      id: '10',
      resId: '3',
      imageUrl: 'https://pbs.twimg.com/media/ExKWCkJWEAA0aij.jpg',
      name: 'Mighty zinger',
      price: '30',
    ),
    const Meal(
      id: '11',
      resId: '3',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR15QA9A6exy-xbhlaBxY38CzYb-mPZsSKcqQ&usqp=CAU',
      name: 'Zinger',
      price: '25',
    ),
    const Meal(
      id: '12',
      resId: '3',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROo7BMozBO5enWm9kCXQeEuZepppd4em9omeLD5bgAQIRc4tJVf53CydnIuvMMtLGNH3I&usqp=CAU',
      name: 'Fries',
      price: '20',
    ),
    const Meal(
      id: '13',
      resId: '3',
      imageUrl:
          'data:image/jpeg;base64,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',
      name: 'Pepsi',
      price: '8',
    ),
    const Meal(
      id: '14',
      resId: '4',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvmin9Xl5PQ6bK21lO8VF44GbEmisDeIZoJQ&usqp=CAU',
      name: 'Chocolate Donut',
      price: '12',
    ),
    const Meal(
      id: '15',
      resId: '4',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPPIPLVRBoFHPgutuaD3NNZ0wYfqD33qxA-w&usqp=CAU',
      name: 'Caramel Donut',
      price: '12',
    ),
    const Meal(
      id: '16',
      resId: '4',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj-9WMGLJspVVOpyaWA00ZgsnZJJ1QGpJr4brzUVfoz-yCm6aDZIRvYfuvnNuZzLJmJjM&usqp=CAU',
      name: 'Honey',
      price: '14',
    ),
    const Meal(
      id: '17',
      resId: '4',
      imageUrl:
          'https://mma.prnewswire.com/media/1738686/Tim_Hortons_Tim_Hortons_introduces_new_white_hot_beverage_lids_a.jpg?p=twitter',
      name: 'Black coffee',
      price: '16',
    ),
    const Meal(
      id: '18',
      resId: '5',
      imageUrl: 'https://hips.hearstapps.com/delish/assets/17/51/1513892402-starbucks-black-and-white-mocha-2.jpg',
      name: 'Mocha',
      price: '21',
    ),
    const Meal(
      id: '19',
      resId: '5',
      imageUrl: 'https://hips.hearstapps.com/delish/assets/17/51/1513892402-starbucks-black-and-white-mocha-2.jpg',
      name: 'Mocha',
      price: '21',
    ),
    const Meal(
      id: '20',
      resId: '5',
      imageUrl: 'https://hips.hearstapps.com/delish/assets/17/51/1513892402-starbucks-black-and-white-mocha-2.jpg',
      name: 'Mocha',
      price: '21',
    ),
    const Meal(
      id: '21',
      resId: '5',
      imageUrl: 'https://hips.hearstapps.com/delish/assets/17/51/1513892402-starbucks-black-and-white-mocha-2.jpg',
      name: 'Mocha',
      price: '21',
    ),
    const Meal(
      id: '22',
      resId: '5',
      imageUrl: 'https://hips.hearstapps.com/delish/assets/17/51/1513892402-starbucks-black-and-white-mocha-2.jpg',
      name: 'Mocha',
      price: '21',
    ),
    const Meal(
      id: '23',
      resId: '6',
      imageUrl:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2022-10/cinnabon-national-cinnamon-day-te-221003-141d69.jpg',
      name: 'Cinnabon',
      price: '22',
    ),
    const Meal(
      id: '24',
      resId: '6',
      imageUrl:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2022-10/cinnabon-national-cinnamon-day-te-221003-141d69.jpg',
      name: 'Cinnabon',
      price: '22',
    ),
    const Meal(
      id: '25',
      resId: '6',
      imageUrl:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2022-10/cinnabon-national-cinnamon-day-te-221003-141d69.jpg',
      name: 'Cinnabon',
      price: '22',
    ),
    const Meal(
      id: '26',
      resId: '6',
      imageUrl:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2022-10/cinnabon-national-cinnamon-day-te-221003-141d69.jpg',
      name: 'Cinnabon',
      price: '22',
    ),
    const Meal(
      id: '27',
      resId: '6',
      imageUrl:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2022-10/cinnabon-national-cinnamon-day-te-221003-141d69.jpg',
      name: 'Cinnabon',
      price: '22',
    ),
    const Meal(
      id: '28',
      resId: '7',
      imageUrl: 'https://s3.amazonaws.com/cms.ipressroom.com/285/files/201602/National+Donut+Day.jpg',
      name: 'Donuts',
      price: '120',
    ),
    const Meal(
      id: '29',
      resId: '7',
      imageUrl: 'https://s3.amazonaws.com/cms.ipressroom.com/285/files/201602/National+Donut+Day.jpg',
      name: 'Donuts',
      price: '120',
    ),
    const Meal(
      id: '30',
      resId: '7',
      imageUrl: 'https://s3.amazonaws.com/cms.ipressroom.com/285/files/201602/National+Donut+Day.jpg',
      name: 'Donuts',
      price: '120',
    ),
    const Meal(
      id: '31',
      resId: '7',
      imageUrl: 'https://s3.amazonaws.com/cms.ipressroom.com/285/files/201602/National+Donut+Day.jpg',
      name: 'Donuts',
      price: '120',
    ),
    const Meal(
      id: '32',
      resId: '7',
      imageUrl: 'https://s3.amazonaws.com/cms.ipressroom.com/285/files/201602/National+Donut+Day.jpg',
      name: 'Donuts',
      price: '120',
    ),
    const Meal(
      id: '33',
      resId: '8',
      imageUrl: 'https://i.insider.com/625eaac94f524b00194d222c?width=1136&format=jpeg',
      name: 'Chocolate',
      price: '30',
    ),
    const Meal(
      id: '34',
      resId: '8',
      imageUrl: 'https://i.insider.com/625eaac94f524b00194d222c?width=1136&format=jpeg',
      name: 'Chocolate',
      price: '30',
    ),
    const Meal(
      id: '35',
      resId: '8',
      imageUrl: 'https://i.insider.com/625eaac94f524b00194d222c?width=1136&format=jpeg',
      name: 'Chocolate',
      price: '30',
    ),
    const Meal(
      id: '36',
      resId: '8',
      imageUrl: 'https://i.insider.com/625eaac94f524b00194d222c?width=1136&format=jpeg',
      name: 'Chocolate',
      price: '30',
    ),
    const Meal(
      id: '37',
      resId: '8',
      imageUrl: 'https://i.insider.com/625eaac94f524b00194d222c?width=1136&format=jpeg',
      name: 'Chocolate',
      price: '30',
    ),
    const Meal(
      id: '38',
      resId: '9',
      imageUrl: 'https://dynl.mktgcdn.com/p/d9AXTJEWMZ156q11dLLVRHsmufNu0K-ng4JYb_4WwRI/599x450.jpg',
      name: 'Chicken Pizza',
      price: '110',
    ),
    const Meal(
      id: '39',
      resId: '9',
      imageUrl: 'https://dynl.mktgcdn.com/p/d9AXTJEWMZ156q11dLLVRHsmufNu0K-ng4JYb_4WwRI/599x450.jpg',
      name: 'Chicken Pizza',
      price: '110',
    ),
    const Meal(
      id: '40',
      resId: '9',
      imageUrl: 'https://dynl.mktgcdn.com/p/d9AXTJEWMZ156q11dLLVRHsmufNu0K-ng4JYb_4WwRI/599x450.jpg',
      name: 'Chicken Pizza',
      price: '110',
    ),
    const Meal(
      id: '41',
      resId: '9',
      imageUrl: 'https://dynl.mktgcdn.com/p/d9AXTJEWMZ156q11dLLVRHsmufNu0K-ng4JYb_4WwRI/599x450.jpg',
      name: 'Chicken Pizza',
      price: '110',
    ),
    const Meal(
      id: '42',
      resId: '9',
      imageUrl: 'https://dynl.mktgcdn.com/p/d9AXTJEWMZ156q11dLLVRHsmufNu0K-ng4JYb_4WwRI/599x450.jpg',
      name: 'Chicken Pizza',
      price: '110',
    ),
    const Meal(
      id: '43',
      resId: '9',
      imageUrl: 'https://dynl.mktgcdn.com/p/d9AXTJEWMZ156q11dLLVRHsmufNu0K-ng4JYb_4WwRI/599x450.jpg',
      name: 'Chicken Pizza',
      price: '110',
    ),
  ];
}
