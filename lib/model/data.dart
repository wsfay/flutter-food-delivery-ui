import 'api.dart';
import 'rest1_data.dart';
import 'rest2_data.dart';
import 'rest3_data.dart';
import 'rest4_data.dart';
import 'rest5_data.dart';

List<Dictionary> dictionary = [
  Dictionary(fullName: {
    FoodCategory.coffee: 'Turpis faucibus quis in posuere convallis'
  }),
  Dictionary(fullName: {FoodCategory.tea: 'Dolor sit amet'}),
  Dictionary(fullName: {FoodCategory.burger: 'Consectetur adipiscing elit'}),
  Dictionary(
      fullName: {FoodCategory.pizza: 'Nam tristique urna ligula eu nisl'}),
  Dictionary(
      fullName: {FoodCategory.pasta: 'Cras malesuada dui dictum metus platea'}),
  Dictionary(fullName: {FoodCategory.rice: 'Ante tellus magna'}),
  Dictionary(fullName: {
    FoodCategory.salad: 'Molestie vulputate mauris dignissim vel etiam'
  }),
  Dictionary(
      fullName: {FoodCategory.chocolate: 'convallis facilisi quisque pretium'}),
  Dictionary(fullName: {FoodCategory.soup: 'A quisque viverra rutrum'}),
  Dictionary(fullName: {
    FoodCategory.chickenSoup: 'Sem sagittis senectus potenti sociosqu mi'
  }),
  Dictionary(fullName: {
    FoodCategory.fruit: 'Nullam leo parturient potenti pretium lacinia'
  }),
  Dictionary(fullName: {FoodCategory.fry: 'Ornare porttitor dui ridiculus'}),
  Dictionary(fullName: {
    FoodCategory.seafood: 'Rhoncus pellentesque potenti mus facilisi'
  }),
  Dictionary(fullName: {FoodCategory.dessert: 'Accumsan at pulvinar'}),
  Dictionary(fullName: {
    FoodCategory.dish: 'Sapien libero augue aliquet blandit velit'
  }),
  Dictionary(fullName: {FoodCategory.bread: 'Accumsan sem integer'}),
  Dictionary(
      fullName: {FoodCategory.juice: 'Vestibulum erat vehicula sapien cursus'}),
  Dictionary(fullName: {
    FoodCategory.drink: 'Lacus augue aptent, magna nascetur convallis'
  }),
];

List<Restaurant> restaurants = [
  Restaurant(
    name: 'Lorem ipsum dolor sit',
    imgUrl:
        'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=387&q=80',
    country: 'Lorem ipsum',
    city: 'Lorem ipsum',
    street: 'Lorem ipsum',
    rating: 4.5,
    openTime: '08:00',
    closedTime: '21:00',
    joinDate: DateTime.utc(2020, 07, 01),
    hasOffer: true,
    description: 'Nibh vehicula litora mus aenean varius',
    menu: rest1menu,
  ),
  Restaurant(
    name: 'Curabitur commodo',
    imgUrl:
        'https://images.unsplash.com/photo-1601912262364-3a35aa0d9399?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=634&q=80',
    country: 'Lorem ipsum',
    city: 'Lorem ipsum',
    street: 'Lorem ipsum',
    rating: 4.3,
    openTime: '08:00',
    closedTime: '21:00',
    joinDate: DateTime.utc(2020, 07, 01),
    hasOffer: false,
    description: 'Nibh vehicula litora mus aenean varius',
    menu: rest2menu,
  ),

  Restaurant(
    name: 'Condimentum integer pretium',
    imgUrl:
        'https://images.unsplash.com/photo-1601748361140-03605c34e843?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=634&q=80',
    country: 'Lorem ipsum',
    city: 'Lorem ipsum',
    street: 'Lorem ipsum',
    rating: 3.5,
    openTime: '08:00',
    closedTime: '21:00',
    joinDate: DateTime.utc(2020, 12, 15),
    hasOffer: true,
    description: 'Nibh vehicula litora mus aenean varius',
    menu: rest3menu,
  ),


  Restaurant(
    name: 'Sed ut perspiciatis unde omnis',
    imgUrl:
        'https://images.unsplash.com/photo-1536184071535-78906f7172c2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=820&q=80',
    country: 'Lorem ipsum',
    city: 'Lorem ipsum',
    street: 'Lorem ipsum',
    rating: 4.1,
    openTime: '08:00',
    closedTime: '21:00',
    joinDate: DateTime.utc(2020, 11, 03),
    hasOffer: true,
    description: 'laudantium, totam rem aperiam',
    menu: rest4menu,
  ),

  Restaurant(
    name: 'Fugiat nulla pariatur',
    imgUrl:
        'https://images.unsplash.com/photo-1534256958597-7fe685cbd745?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=700&q=80',
    country: 'Lorem ipsum',
    city: 'Lorem ipsum',
    street: 'Lorem ipsum',
    rating: 4.1,
    openTime: '08:00',
    closedTime: '21:00',
    joinDate: DateTime.utc(2020, 08, 15),
    hasOffer: true,
    description: 'At vero eos et accusamus',
    menu: rest5menu,
  ),
];
