import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/app_state.dart';
import 'rail_bottom_nav_pages/home.dart';
import 'rail_bottom_nav_pages/order.dart';
import 'rail_bottom_nav_pages/settings.dart';

class HomePageWithRailNav extends StatefulWidget {
  @override
  _HomePageWithRailNavState createState() => _HomePageWithRailNavState();
}

class _HomePageWithRailNavState extends State<HomePageWithRailNav> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, indexOfItem, child) {
      return Scaffold(
        body: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: indexOfItem.indexOfSelectedItem,
              onDestinationSelected: (int selectedIndex) {
                indexOfItem.indexOfSelectedItem = selectedIndex;
                indexOfItem.isClicked = true;
              },
              labelType: NavigationRailLabelType.selected,
              destinations: _railItems
                  .map(
                    (r) => NavigationRailDestination(
                      label: r.label,
                      icon: r.icon,
                      selectedIcon: r.selectedIcon,
                    ),
                  )
                  .toList(),
            ),
            VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: _pages[indexOfItem.indexOfSelectedItem],
            )
          ],
        ),
      );
    });
  }
}

final _railItems = [
  NavigationRailDestination(
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home),
    label: Text('Home'),
  ),
  NavigationRailDestination(
    icon: Icon(Icons.shopping_basket_outlined),
    selectedIcon: Icon(Icons.shopping_basket),
    label: Text('Order'),
  ),
  NavigationRailDestination(
    icon: Icon(Icons.settings_outlined),
    selectedIcon: Icon(Icons.settings),
    label: Text('Settings'),
  ),
];

final _pages = [
  Home(),
  Order(),
  Settings(),
];
