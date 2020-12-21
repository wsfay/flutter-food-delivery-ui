import 'package:flutter/material.dart';
import '../../widgets/restaurants_grid.dart';
import '../../model/fetch_data.dart';
import '../../model/api.dart';

class All extends StatefulWidget {
  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  List<Restaurant> _allAvailableRestaurants;

  Future<List<Restaurant>> callFetchRestaurant() async {
    _allAvailableRestaurants = await FetchData().fetchRestaurant(all: true);
    return _allAvailableRestaurants;
    // Future.value(allRestaurant)
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Restaurant>>(
      future: callFetchRestaurant(),
      builder:
          (BuildContext context, AsyncSnapshot<List<Restaurant>> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = [
            Expanded(
                child: RestaurantsGrid(allAvailableRestaurants: snapshot.data))
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Fetch data ...'),
            )
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        );
      },
    );

  }
}
