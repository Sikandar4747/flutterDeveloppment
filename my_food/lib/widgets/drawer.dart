import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_food/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildList(String text, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Keep Cooking!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            height: 20,
          ),
          buildList('Meals', Icons.restaurant, () {
            Navigator.pushNamed(context, '/');
          }),
          buildList('Filters', Icons.settings, () {
            Navigator.pushNamed(context, FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
