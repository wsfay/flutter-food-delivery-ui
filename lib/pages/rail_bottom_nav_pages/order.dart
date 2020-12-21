import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          'Order',
        ),
      ),
      body: Center(
        child: Text('implement it',style: Theme.of(context).textTheme.bodyText1,),
      ),
    );
  }
}
