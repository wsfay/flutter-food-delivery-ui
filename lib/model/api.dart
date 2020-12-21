class Dictionary {
  final Map<FoodCategory, String> fullName;

  Dictionary({this.fullName});
}

enum FoodCategory {
  coffee,
  tea,
  burger,
  pizza,
  pasta,
  rice,
  salad,
  chocolate,
  soup,
  chickenSoup,
  fruit,
  fry,
  seafood,
  dessert,
  dish,
  bread,
  juice,
  drink
}

class Restaurant {
  final String name;
  final String imgUrl;
  final String country;
  final String city;
  final String street;
  final double rating;
  final String openTime;
  final String closedTime;
  final DateTime joinDate;
  final bool hasOffer;
  final String description;
  final Menu menu;
  Restaurant({
    this.name,
    this.imgUrl,
    this.country,
    this.city,
    this.street,
    this.rating,
    this.openTime,
    this.closedTime,
    this.joinDate,
    this.hasOffer,
    this.description,
    this.menu,
  });
}

class Menu {
  final List<Map<FoodCategory, List<Food>>> categoryWithFoods;

  Menu({this.categoryWithFoods});
}

class Food {
  final String foodName;
  final String foodImgUrl;
  final String description;
  final double price;
  final bool isOffer;

  Food({
    this.foodName,
    this.foodImgUrl,
    this.description,
    this.price,
    this.isOffer,
  });
}
