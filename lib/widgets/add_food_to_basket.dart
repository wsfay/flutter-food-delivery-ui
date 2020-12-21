import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/colors.dart';

class AddFoodToBasket extends StatefulWidget {
  final String foodName;
  final String foodDescription;
  final double price;

  const AddFoodToBasket(
      {Key key, this.foodName, this.foodDescription, this.price})
      : super(key: key);

  @override
  _AddFoodToBasketState createState() => _AddFoodToBasketState();
}

class _AddFoodToBasketState extends State<AddFoodToBasket> {
  int _quantity = 1;
  double _totalPrice = 0;
  void _addItem() {}
  void _increase() {
    setState(() {
      _quantity++;
    });
  }

  void _decrease() {
    setState(() {
      if (_quantity >= 2) {
        _quantity--;
      }
    });
  }

  void loadTotalPrice() {
    setState(() {
      _totalPrice = _quantity * (widget.price);
    });
  }

  @override
  Widget build(BuildContext context) {
    loadTotalPrice();
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('Add item'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 24.0,
          bottom: 24.0,
          left: 16.0,
          right: 16.0,
        ),
        child: ListView(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  widget.foodName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  widget.foodDescription,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Center(
                child: Container(
              height: 150.0,
              margin: EdgeInsets.only(
                bottom: 16.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        color: titleBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                          10.0,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Price: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      )),
                              TextSpan(
                                text: '\$${widget.price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        color: titleBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                          10.0,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'To pay: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '\$$_totalPrice',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
            Center(
              child: Container(
                height: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: titleBackground,
                ),
                margin: EdgeInsets.only(bottom: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Quantity',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: OutlinedButton(
                              onPressed: _decrease,
                              child: Icon(
                                Icons.remove,
                                size: 28.0,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16.0, right: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: titleBackground,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '$_quantity',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0,
                                    ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: OutlinedButton(
                              onPressed: _increase,
                              child: Icon(
                                Icons.add,
                                size: 28.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: titleBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: ElevatedButton(
            onPressed: () => _addItem,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0,
              ),
              child: Text(
                'Add item',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: whiteColor,
                      fontSize: 16.0,
                    ),
              ),
            ),
          ),
        ),
        elevation: 0,
      ),
    );
  }
}
