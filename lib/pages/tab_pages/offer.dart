import 'package:flutter/material.dart';
import '../../model/api.dart';
import '../../model/fetch_data.dart';
import '../../widgets/restaurants_grid.dart';

class Offer extends StatefulWidget {
  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  List<Restaurant> _allAvailableRestaurants;

  Future<List<Restaurant>> callFetchRestaurant() async {
    _allAvailableRestaurants = await FetchData().fetchRestaurant(offer: true);
    return _allAvailableRestaurants;
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
