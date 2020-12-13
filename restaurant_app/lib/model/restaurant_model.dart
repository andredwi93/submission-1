class RestaurantModel {
  List<Restaurants> restaurants;

  RestaurantModel({this.restaurants});

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    var listOfRestaurant =
        List<Map<String, dynamic>>.from(json["restaurants"]).toList();
    List<Restaurants> restaurants = List<Restaurants>();
    restaurants =
        listOfRestaurant.map((resto) => Restaurants.fromJson(resto)).toList();

    return RestaurantModel(
      restaurants: restaurants,
    );
  }
}

class Restaurants {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menus;

  Restaurants({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });

  factory Restaurants.fromJson(Map<String, dynamic> json) {
    return Restaurants(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      pictureId: json["pictureId"],
      city: json["city"],
      rating: json["rating"].toDouble(),
      menus: Menus.fromJson(json["menus"]),
    );
  }
}

class Menus {
  List<Foods> foods;
  List<Drinks> drinks;

  Menus({this.foods, this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) {
    var listOfFoods = List<Map<String, dynamic>>.from(json["foods"]).toList();
    List<Foods> foods = List<Foods>();
    foods = listOfFoods.map((food) => Foods.fromJson(food)).toList();

    var listOfDrinks = List<Map<String, dynamic>>.from(json["drinks"]).toList();
    List<Drinks> drinks = List<Drinks>();
    drinks = listOfDrinks.map((drink) => Drinks.fromJson(drink)).toList();

    return Menus(
      foods: foods,
      drinks: drinks,
    );
  }
}

class Foods {
  String name;
  Foods({this.name});

  factory Foods.fromJson(Map<String, dynamic> json) {
    return Foods(name: json["name"]);
  }
}

class Drinks {
  String name;
  Drinks({this.name});

  factory Drinks.fromJson(Map<String, dynamic> json) {
    return Drinks(name: json["name"]);
  }
}
