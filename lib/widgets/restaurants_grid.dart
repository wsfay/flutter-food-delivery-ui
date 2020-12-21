import 'package:flutter/material.dart';
import '../widgets/restaurant_card.dart';
import '../model/api.dart';
import '../constants.dart';

class RestaurantsGrid extends StatefulWidget {
  final List<Restaurant> allAvailableRestaurants;

  const RestaurantsGrid({Key key, this.allAvailableRestaurants})
      : super(key: key);
  @override
  _RestaurantsGridState createState() => _RestaurantsGridState();
}

class _RestaurantsGridState extends State<RestaurantsGrid> {
  int _columns;

  double _aspectRatio;

  bool _isNavRailDisplayed = false;

  void _calculateColumnsCount(double wide) {
    _columns = _isNavRailDisplayed
        ? ((wide - (LEFT_RIGHT_PADDING_TOTAL + NAV_RAIL_WIDTH)) /
                (MAX_CROSS_AXIS_EXTENT + CROSS_AXIS_SPACING))
            .ceil()
        : ((wide - (LEFT_RIGHT_PADDING_TOTAL)) /
                (MAX_CROSS_AXIS_EXTENT + CROSS_AXIS_SPACING))
            .ceil();
  }

  void _calculateAspectRatio(double wide) {
    _aspectRatio = _isNavRailDisplayed
        ? ((wide - (LEFT_RIGHT_PADDING_TOTAL + NAV_RAIL_WIDTH)) / _columns) /
            (MAX_CROSS_AXIS_EXTENT + CROSS_AXIS_SPACING)
        : ((wide - (LEFT_RIGHT_PADDING_TOTAL)) / _columns) /
            (MAX_CROSS_AXIS_EXTENT + CROSS_AXIS_SPACING);
  }

  void _withNavRail(double wide) {
    if (wide > 599) {
      _isNavRailDisplayed = true;
    } else {
      _isNavRailDisplayed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final wdth = MediaQuery.of(context).size.width;
    _withNavRail(wdth);
    _calculateColumnsCount(wdth);
    _calculateAspectRatio(wdth);
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            key: PageStorageKey<String>('all'),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              (widget.allAvailableRestaurants.length > 0 ||
                      widget.allAvailableRestaurants.isNotEmpty)
                  ? SliverPadding(
                      padding: const EdgeInsets.all(PADDING),
                      sliver: _buildGridSliverDelegate(),
                    )
                  : _buildEmptyWidget(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyWidget() {
    return SliverFillRemaining(
      child: Center(child: Text('No data!')),
    );
  }

  Widget _buildGridSliverDelegate() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MAX_CROSS_AXIS_EXTENT,
        mainAxisSpacing: MAIN_AXIS_SPACING,
        crossAxisSpacing: CROSS_AXIS_SPACING,
        childAspectRatio: _aspectRatio,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return RestaurantCard(
            index: index,
            allAvailableRestaurants: widget.allAvailableRestaurants,
          );
        },
        childCount: widget.allAvailableRestaurants.length,
      ),
    );
  }
}
