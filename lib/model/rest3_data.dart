


import 'api.dart';


// #3
Menu rest3menu = Menu(
  categoryWithFoods: [
    {FoodCategory.coffee: allCoffee},
    {FoodCategory.burger: allBurger},
    {FoodCategory.seafood: allSeafood},
    {FoodCategory.tea: allTea},
    {FoodCategory.juice: allJuice},
  ],
);

List<Food> allCoffee = [
  Food(
    foodName: 'Luctus nam feugiat',
    foodImgUrl:
        'https://images.unsplash.com/photo-1478369402113-1fd53f17e8b4?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=362&q=80',
    description: 'Fusce rutrum commodo orci facilisi, volutpat at',
    price: 6,
    isOffer: false,
  ),
  Food(
    foodName: 'Viverra tempor pretium sem',
    foodImgUrl:
        'https://images.unsplash.com/photo-1542781087-a6703ce00861?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    description:
        'Curae pharetra sociis fermentum gravida tortor, fringilla feugiat molestie',
    price: 5,
    isOffer: false,
  ),
  Food(
    foodName: 'Felis nam torquent nullam eu',
    foodImgUrl:
        'https://images.unsplash.com/photo-1594653407204-74b2f9aa1e10?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
    description:
        'Platea quisque class est eget vivamus, rutrum curabitur potenti',
    price: 4,
    isOffer: false,
  ),
];

List<Food> allBurger = [
  Food(
    foodName: 'Luctus nam feugiat',
    foodImgUrl:
        'https://images.unsplash.com/photo-1478369402113-1fd53f17e8b4?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=362&q=80',
    description: 'Fusce rutrum commodo orci facilisi, volutpat at',
    price: 2,
    isOffer: false,
  ),
  Food(
    foodName: 'Viverra tempor pretium sem',
    foodImgUrl:
        'https://images.unsplash.com/photo-1542781087-a6703ce00861?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    description:
        'Curae pharetra sociis fermentum gravida tortor, fringilla feugiat molestie',
    price: 3,
    isOffer: false,
  ),
  Food(
    foodName: 'Felis nam torquent nullam eu',
    foodImgUrl:
        'https://images.unsplash.com/photo-1594653407204-74b2f9aa1e10?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
    description:
        'Platea quisque class est eget vivamus, rutrum curabitur potenti',
    price: 4,
    isOffer: false,
  ),
];

List<Food> allSeafood = [
  Food(
    foodName: 'Luctus nam feugiat',
    foodImgUrl:
        'https://images.unsplash.com/photo-1478369402113-1fd53f17e8b4?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=362&q=80',
    description: 'Fusce rutrum commodo orci facilisi, volutpat at',
    price: 2,
    isOffer: false,
  ),
  Food(
    foodName: 'Viverra tempor pretium sem',
    foodImgUrl:
        'https://images.unsplash.com/photo-1542781087-a6703ce00861?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    description:
        'Curae pharetra sociis fermentum gravida tortor, fringilla feugiat molestie',
    price: 3,
    isOffer: false,
  ),
  Food(
    foodName: 'Felis nam torquent nullam eu',
    foodImgUrl:
        'https://images.unsplash.com/photo-1594653407204-74b2f9aa1e10?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
    description:
        'Platea quisque class est eget vivamus, rutrum curabitur potenti',
    price: 4,
    isOffer: false,
  ),
];

List<Food> allTea = [
  Food(
    foodName: 'Luctus nam feugiat',
    foodImgUrl:
        'https://images.unsplash.com/photo-1478369402113-1fd53f17e8b4?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=362&q=80',
    description: 'Fusce rutrum commodo orci facilisi, volutpat at',
    price: 2,
    isOffer: false,
  ),
  Food(
    foodName: 'Viverra tempor pretium sem',
    foodImgUrl:
        'https://images.unsplash.com/photo-1542781087-a6703ce00861?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    description:
        'Curae pharetra sociis fermentum gravida tortor, fringilla feugiat molestie',
    price: 3,
    isOffer: false,
  ),
  Food(
    foodName: 'Felis nam torquent nullam eu',
    foodImgUrl:
        'https://images.unsplash.com/photo-1594653407204-74b2f9aa1e10?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
    description:
        'Platea quisque class est eget vivamus, rutrum curabitur potenti',
    price: 4,
    isOffer: false,
  ),
];

List<Food> allJuice = [
  Food(
    foodName: 'Luctus nam feugiat',
    foodImgUrl:
        'https://images.unsplash.com/photo-1478369402113-1fd53f17e8b4?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=362&q=80',
    description: 'Fusce rutrum commodo orci facilisi, volutpat at',
    price: 2,
    isOffer: false,
  ),
  Food(
    foodName: 'Viverra tempor pretium sem',
    foodImgUrl:
        'https://images.unsplash.com/photo-1542781087-a6703ce00861?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    description:
        'Curae pharetra sociis fermentum gravida tortor, fringilla feugiat molestie',
    price: 3,
    isOffer: false,
  ),
  Food(
    foodName: 'Felis nam torquent nullam eu',
    foodImgUrl:
        'https://images.unsplash.com/photo-1594653407204-74b2f9aa1e10?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
    description:
        'Platea quisque class est eget vivamus, rutrum curabitur potenti',
    price: 4,
    isOffer: false,
  ),
];
