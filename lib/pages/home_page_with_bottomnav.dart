import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/app_state.dart';
import 'rail_bottom_nav_pages/home.dart';
import 'rail_bottom_nav_pages/order.dart';
import 'rail_bottom_nav_pages/settings.dart';

class HomePageWithBottomNav extends StatefulWidget {
  @override
  _HomePageWithBottomNavState createState() => _HomePageWithBottomNavState();
}

class _HomePageWithBottomNavState extends State<HomePageWithBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, indexOfItem, child) {
      return Scaffold(
        body: _pages[indexOfItem.indexOfSelectedItem],
        bottomNavigationBar: BottomNavigationBar(
          items: _bottomItems
              .map(
                (b) => BottomNavigationBarItem(
                  label: b.label,
                  icon: b.icon,
                  activeIcon: b.activeIcon,
                ),
              )
              .toList(),
          currentIndex: indexOfItem.indexOfSelectedItem,
          onTap: (int selectedIndex) {
            indexOfItem.indexOfSelectedItem = selectedIndex;
            indexOfItem.isClicked = true;
          },
        ),
      );
    });
  }
}

final _bottomItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_basket_outlined),
    activeIcon: Icon(Icons.shopping_basket),
    label: 'Order',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings_outlined),
    activeIcon: Icon(Icons.settings),
    label: 'Settings',
  ),
];

final _pages = [
  Home(),
  Order(),
  Settings(),
];
