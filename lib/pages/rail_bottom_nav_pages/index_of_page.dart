import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../model/app_state.dart';
import '../../globals.dart';
import 'home.dart';
import 'order.dart';
import 'settings.dart';

class IndexOfPage extends StatefulWidget {
  @override
  _IndexOfPageState createState() => _IndexOfPageState();
}

class _IndexOfPageState extends State<IndexOfPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, indexOfItem, child) {
      return IndexedStack(
        index: indexOfItem.indexOfSelectedItem,
        children: [
          Home(),
          Order(),
          Settings(),
          Navigator(
            key: nk,
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settings) {
              // if (settings.name == '/search') {
              //   indexOfItem.indexOfSelectedItem = 1;
              // }

              WidgetBuilder builder;
              switch (settings.name) {
                case '/':
                  builder = (BuildContext _) => Home();
                  break;
                case '/order':
                  builder = (BuildContext _) => Order();
                  break;
                case '/settings':
                  builder = (BuildContext _) => Settings();
                  break;
                default:
                  throw Exception('Invalid route: ${settings.name}');
              }
              return MaterialPageRoute(builder: builder, settings: settings);
            },
          ),
        ],
      );
    });
  }
}
