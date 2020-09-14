import 'package:flutter/material.dart';
import 'package:flutter_app_shop/dummy_data.dart';
import 'package:flutter_app_shop/models/meal.dart';
import 'package:flutter_app_shop/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const nameRoute = '/Category_Meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);


  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadindIntData = false;


  @override
  void didChangeDependencies() {
    if(!_loadindIntData){
      final routeArgs =
      ModalRoute.of(context).settings.arguments as Map<String,String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget.availableMeals.where((meal){
        return meal.categories.contains(categoryId);
      }).toList();
      _loadindIntData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    displayedMeals.removeWhere((meal)=> meal.id == mealId);

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder:(ctx,index){
            return MealItem(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imageUrl: displayedMeals[index].imageUrl,
                duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
            );
          },
          itemCount: displayedMeals.length,
          ),
    );
  }
}
