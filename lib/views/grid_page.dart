import 'package:flutter/material.dart';
import 'package:shop_all/grid_card.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:shop_all/views/cars_page.dart';
import 'package:shop_all/views/lifestyle_page.dart';

class GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopAll'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Obinna Amadi'),
              accountEmail: Text('donaldamadi15@gmail.com'),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  print('Hey');
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('D', style: TextStyle(fontSize: 40)),
                ),
              ),
            ),
            ListTile(
              title: Text('Fashion Page'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => LifeStylePage()));
              },
            ),
            ListTile(
              title: Text('Cars Page'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => CarsPage()));
              },
            ),
          ],
        ),
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(content: Text('Press back again to leave.')),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.count(
            childAspectRatio: 1.0,
            crossAxisCount: 2,
            padding: EdgeInsets.all(4),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: List.generate(choices.length, (index) {
              return Center(
                child: GridCard(choice: choices[index]),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.image, this.route});

  final String title;
  final String image;
  final String route;
}

const List<Choice> choices = const [
  const Choice(title: 'LifeStyle', image: 'lifestyle.jpg', route: '/lifestyle'),
  const Choice(title: 'Gadgets', image: 'tech.jpg', route: '/gadgets'),
  const Choice(title: 'Food', image: 'food.jpg', route: '/food'),
  const Choice(title: 'Books', image: 'books.jpg', route: '/books'),
  const Choice(
      title: 'Appliances', image: 'appliances.jpg', route: '/appliances'),
  const Choice(title: 'Cars', image: 'cars.jpg', route: '/cars'),
  const Choice(title: 'Furniture', image: 'furniture.jpg', route: '/furniture'),
  const Choice(
      title: 'Real Estate', image: 'real-estate.jpg', route: '/realEstate'),
  const Choice(
      title: 'My Collection', image: 'mycollection.png', route: '/realEstate'),
];