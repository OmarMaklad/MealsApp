import 'package:flutter/material.dart';
import 'package:flutter_app_shop/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(String title,IconData icon,Function tabHandler){
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 120,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text("Cooking Up!",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
            ),
          ),
          SizedBox(height: 20,),
          buildListTitle(
              'Meal',
              Icons.restaurant,
              (){
                Navigator.of(context).pushReplacementNamed('/');
              },
          ),
          buildListTitle(
              "Filters",
              Icons.settings,
                  (){
                Navigator.of(context).pushReplacementNamed(FiltersScreen.nameRoute);
                  },
          ),

        ],
      ),
    );
  }
}
