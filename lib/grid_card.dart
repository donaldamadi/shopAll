import 'package:flutter/material.dart';
import 'package:shop_all/views/grid_page.dart';

class GridCard extends StatelessWidget {
  const GridCard({Key? key, this.choice}) : super(key: key);

  final Choice? choice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '${choice!.route}');
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 5,
        child: Container(
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/grid_images/${choice!.image}'),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black26,
              ),
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      choice!.title!,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
