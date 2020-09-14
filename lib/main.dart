import 'package:flutter/material.dart';
import 'package:flutter_app_shop/models/meal.dart';
import 'package:flutter_app_shop/screens/categories_meals_screen.dart';
import 'package:flutter_app_shop/screens/filters_screen.dart';
import 'package:flutter_app_shop/screens/meal_detail_screen.dart';
import 'package:flutter_app_shop/screens/tabs_screen.dart';

import 'dummy_data.dart';
import 'screens/categories_screen.dart';

void main()=> runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
     Map<String,bool> _filters = {
       'gluten': false,
       'lactose':false,
       'vegan' : false,
       'vegetarian' : false,
     };

     List<Meal> _availableMeals = DUMMY_MEALS;
     List<Meal> _favoriteeMeals =[];

     void _setFilters( Map<String,bool> filterData){
       setState(() {
         _filters = filterData;
         _availableMeals = DUMMY_MEALS.where((meal){
           if(_filters['gluten'] && !meal.isGlutenFree){
             return false;
           }
           if(_filters['lactose'] && !meal.isLactoseFree){
             return false;
           }
           if(_filters['vegan'] && !meal.isVegan){
             return false;
           }
           if(_filters['vegetarian'] && !meal.isVegetarian){
             return false;
           }
           return true;

         }).toList();
       });

     }

     void _toggleFavorite(String mealId){
       final existingIndex =
       _favoriteeMeals.indexWhere((meal) => meal.id == mealId);
       if(existingIndex >= 0){
         setState(() {
           _favoriteeMeals.removeAt(existingIndex);
         });
       }else{
         setState(() {
           _favoriteeMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),);
         });
       }
     }
     bool _isMealFavorite(String id){
       return _favoriteeMeals.any((meal) => meal.id == id);
     }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DeliMeal",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        //canvasColor:Color.fromARGB(255, 254, 229, 1)
      ),
      //home: CategoriesScreen(),
      routes: {
        '/':(ctx)=> TabsScreen(_favoriteeMeals),
        CategoryMealsScreen.nameRoute: (ctx)=> CategoryMealsScreen(_availableMeals),
        MealDetailScreen.nameRoute :(ctx)=>  MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FiltersScreen.nameRoute:(ctx)=>FiltersScreen(_filters ,_setFilters),
      },
      onUnknownRoute: (settings ){
        return MaterialPageRoute(builder: (ctx)=> CategoriesScreen(),
        );
      },
    );
  }
}




