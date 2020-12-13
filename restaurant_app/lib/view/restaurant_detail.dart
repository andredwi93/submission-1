import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_model.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final Restaurants restaurants;

  RestaurantDetail({@required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: restaurants.id,
                  child: Image.network(
                    restaurants.pictureId,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  restaurants.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white.withOpacity(.9)),
                ),
                centerTitle: true,
                titlePadding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              ),
            ),
          ];
        },
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey[400],
                ),
                Text(
                  restaurants.city,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber[400],
                ),
                Text('${restaurants.rating}')
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              restaurants.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Menu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8,
            ),
            Table(
              columnWidths: {1: FractionColumnWidth(0.75)},
              children: [
                TableRow(
                  children: [
                    Text('Makanan'),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: restaurants.menus.foods
                            .map((food) => Text('- ${food.name}'))
                            .toList(),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Minuman'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: restaurants.menus.drinks
                          .map((drink) => Text('- ${drink.name}'))
                          .toList(),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
