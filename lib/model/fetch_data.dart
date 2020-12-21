import 'api.dart';
import 'data.dart';

class FetchData {

//  Future<List<Restaurant>> fetchMyRestaurant() => Future<List<Restaurant>>.delayed(
//         Duration(seconds: 2),
//         () => restaurants,
//       );

  Future<List<Restaurant>> fetchRestaurant(
          {bool all, bool top, bool recent, bool offer}) =>
      Future<List<Restaurant>>.delayed(
        Duration(seconds: 3),
        () {
          List<Restaurant> rests;
          if (all == true) {
            rests = restaurants.toList();
          } else if (top == true) {
           rests = restaurants.where((r) => r.rating >= 4.0).toList();
          } else if (recent == true) {
            DateTime today = new DateTime.now().toUtc();
            rests = restaurants
                .where((r) => today.difference(r.joinDate).inDays <= 10)
                .toList();
          } else if (offer == true) {
            rests = restaurants.where((r) => r.hasOffer == true).toList();
          }
          return rests;
        },
      );

  Future<Map<FoodCategory, List<Food>>> fetchFoodsOfRestaurant(
      int restaurantIndex, List<Restaurant> myrests) {
    return Future<Map<FoodCategory, List<Food>>>.delayed(
      Duration(seconds: 3),
      () {
        Map<FoodCategory, List<Food>> food;
        for (var j = 0;
            j < myrests[restaurantIndex].menu.categoryWithFoods.length;
            j++) {
          food = myrests[restaurantIndex]
              .menu
              .categoryWithFoods[j]
              .map((key, value) => MapEntry(key, value));
         

        }
        return food;
      },
    );
  }


}
