import 'package:flutter/material.dart';
import 'package:flutter_app_shop/models/meal.dart';
import 'package:flutter_app_shop/screens/categories_screen.dart';
import 'package:flutter_app_shop/screens/favorites_screen.dart';
import 'package:flutter_app_shop/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>> _Pages ;
  int _selectPageIndex = 0;
  @override
  void initState() {
    _Pages =[
      {
        'page': CategoriesScreen(),
        'title': "Categories",
      },

      {
        'page': FavoritesScreen( widget.favoriteMeals),
        'title': "Your Favorites",
      },
    ];

    super.initState();
  }

  void _selectPage(int index){
    setState(() {
      _selectPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: Text(_Pages[_selectPageIndex]['title']),
          ),
          drawer: MainDrawer(),
          body: _Pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectPageIndex,
        type: BottomNavigationBarType.shifting,

        backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text("Categories"),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text("Favorites"),
            ),
          ],
      ),
    );

  }
}
