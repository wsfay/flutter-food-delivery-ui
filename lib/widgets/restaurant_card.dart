import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/api.dart';
import 'foods_of_restaurant.dart';

class RestaurantCard extends StatefulWidget {
  final int index;
  final List<Restaurant> allAvailableRestaurants;

  const RestaurantCard({Key key, this.index, this.allAvailableRestaurants})
      : super(key: key);
  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodsOfRestaurant(
                title: widget.allAvailableRestaurants[widget.index].name,
                restaurantIndex: widget.index,
                allAvailableRestaurants: widget.allAvailableRestaurants,
              ),
            ),
          );
        },
        splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
        highlightColor: Colors.transparent,
        child: _CardContent(
          restaurant: widget.allAvailableRestaurants[widget.index],
        ),
      ),
    );
  }
}

class _CardContent extends StatefulWidget {
  final Restaurant restaurant;

  const _CardContent({Key key, this.restaurant}) : super(key: key);
  @override
  _CardContentState createState() => _CardContentState();
}

class _CardContentState extends State<_CardContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: (MAX_CROSS_AXIS_EXTENT / 2.0),
          child: Stack(
            children: [
              Positioned.fill(
                child: Ink.image(
                  image: NetworkImage(
                    widget.restaurant.imgUrl,
                  ),
                  fit: BoxFit.cover,
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
          child: SizedBox(
            height: (MAX_CROSS_AXIS_EXTENT / 2.0) - 30,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      widget.restaurant.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 18.0,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    widget.restaurant.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 10.0,
                            ),
                            child: Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16.0,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 10.0,
                            ),
                            child: Text(
                              '${widget.restaurant.rating}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
