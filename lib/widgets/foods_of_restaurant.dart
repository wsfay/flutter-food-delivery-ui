import 'dart:ui';

import 'package:flutter/material.dart';

import '../colors.dart';
import '../model/api.dart';
import '../model/fetch_data.dart';
import '../model/data.dart';
import 'add_food_to_basket.dart';

class FoodsOfRestaurant extends StatefulWidget {
  final String title;
  final int restaurantIndex;
  final List<Restaurant> allAvailableRestaurants;

  const FoodsOfRestaurant(
      {Key key, this.title, this.restaurantIndex, this.allAvailableRestaurants})
      : super(key: key);
  @override
  _FoodsOfRestaurantState createState() => _FoodsOfRestaurantState();
}

class _FoodsOfRestaurantState extends State<FoodsOfRestaurant> {
  Map<FoodCategory, List<Food>> allFoodCategoryWithFoods;
  Future<Map<FoodCategory, List<Food>>> callFetchFoodsOfRestaurant() async {
    allFoodCategoryWithFoods = await FetchData().fetchFoodsOfRestaurant(
        widget.restaurantIndex, widget.allAvailableRestaurants);
    return allFoodCategoryWithFoods;
    // Future.value(allRestaurant)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<FoodCategory, List<Food>>>(
        future: callFetchFoodsOfRestaurant(),
        builder: (context, snapshot) {
          Widget child;
          if (snapshot.hasData) {
            child = _CustomScrollView(
                allAvailableRestaurants: widget.allAvailableRestaurants,
                restaurantIndex: widget.restaurantIndex,
                title: widget.title,
                categoryWithFoods: snapshot.data);
          } else if (snapshot.hasError) {
            child = Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ],
              ),
            );
          } else {
            child = Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Fetch data ...'),
                )
              ],
            ));
          }
          return child;
        },
      ),
    );
  }
}

class _CustomScrollView extends StatefulWidget {
  final List<Restaurant> allAvailableRestaurants;
  final int restaurantIndex;
  final String title;
  final Map<FoodCategory, List<Food>> categoryWithFoods;

  const _CustomScrollView(
      {Key key,
      this.allAvailableRestaurants,
      this.restaurantIndex,
      this.title,
      this.categoryWithFoods})
      : super(key: key);

  @override
  __CustomScrollViewState createState() => __CustomScrollViewState();
}

class __CustomScrollViewState extends State<_CustomScrollView> {
  List<Widget> list = [];
  @override
  Widget build(BuildContext context) {
    _buildText(widget.allAvailableRestaurants, widget.categoryWithFoods,
        widget.restaurantIndex);
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        _buildSliverAppbar(widget.title,
            widget.allAvailableRestaurants[widget.restaurantIndex]),
        _buildIntroduction(),
        for (var i = 0; i < list.length; i++) list[i],
      ],
    );
  }

  List<Widget> _buildText(List<Restaurant> allAvailableRestaurants,
      Map<FoodCategory, List<Food>> map, int restaurantIndex) {
    for (var j = 0;
        j <
            allAvailableRestaurants[restaurantIndex]
                .menu
                .categoryWithFoods
                .length;
        j++) {
      var food = allAvailableRestaurants[restaurantIndex]
          .menu
          .categoryWithFoods[j]
          .map((key, value) => MapEntry(key, value));

      for (var m in food.entries) {
        list.add(
          SliverToBoxAdapter(
            child: _buildCategoryTitle(m.key),
          ),
        );
        for (var k = 0; k < m.value.length; k++) {
          list.add(
            SliverToBoxAdapter(
              child: _buildFoods(m.value[k]),
            ),
          );
        }
      }
    }

    return list;
  }

  Widget _buildSliverAppbar(String title, Restaurant restaurant) {
    return SliverAppBar(
      brightness: Brightness.dark,
      stretch: true,
      floating: false,
      pinned: true,
      snap: false,
      onStretchTrigger: () async {
        // print('stretch');

        return;
      },
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: whiteColor,
                  fontSize: 18.0,
                ),
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              restaurant.imgUrl,
              fit: BoxFit.cover,
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, 0.5),
                  end: Alignment(0.0, 0.0),
                  colors: <Color>[
                    Color(0x60000000),
                    Color(0x00000000),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTitle(FoodCategory key) {
    String t = '';
    for (var i = 0; i < dictionary.length; i++) {
      Map<FoodCategory, String> f =
          dictionary[i].fullName.map((key, value) => MapEntry(key, value));

      for (var fc in f.entries) {
        if (fc.key == key) {
          t = fc.value;
        }
      }

      // print(t);
    }
    return SizedBox(
      height: 70.0,
      child: Container(
        color: titleBackground,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              t,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFoods(Food value) {
    return Material(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      elevation: 1.0,
      child: InkWell(
        //highlightColor: Colors.transparent,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddFoodToBasket(
              foodName: value.foodName,
              foodDescription: value.description,
              price: value.price,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
          child: _ListTile(
            title: value.foodName,
            description: value.description,
            price: '${value.price}',
            image: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    value.foodImgUrl,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIntroduction() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Text(
          'Menu',
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontSize: 28.0,
              ),
        ),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  _ListTile({
    Key key,
    this.title,
    this.description,
    this.price,
    this.image,
  }) : super(key: key);

  final String title;
  final String description;
  final String price;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
                child: _ListTileContent(
                  title: title,
                  description: description,
                  price: price,
                ),
              ),
            ),
            SizedBox(
              height: 100.0,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListTileContent extends StatelessWidget {
  _ListTileContent({
    Key key,
    this.title,
    this.description,
    this.price,
  }) : super(key: key);

  final String title;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 8.0)),
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: titleBackground,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    '\$$price',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
