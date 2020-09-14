import 'package:flutter/material.dart';

import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id,this.title, this.color);

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
       CategoryMealsScreen.nameRoute,
      arguments: {
          'id':id,
          'title':title,
      },

    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectCategory(context),
      splashColor: Colors.pink,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          ),
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
