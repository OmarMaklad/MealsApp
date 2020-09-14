import 'package:flutter/material.dart';
import 'package:flutter_app_shop/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const nameRoute = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite ;
  MealDetailScreen(this.toggleFavorite,this.isFavorite);
  Widget buildSectionTitle (BuildContext context,String text){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget buildContainer (Widget child){
    return  Container(
        decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(10),
    ),
    height: 150,
    width: 300,
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
      child: child,
    );
  }
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere(
            (meal)=> meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectMeal.title}'),
      ),
      body:SingleChildScrollView(
        child: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
                selectMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, "Ingradient"),
          buildContainer(
             ListView.builder(
                itemBuilder: (context,index)=>
                    Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                            selectMeal.ingredients[index],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red
                          ),
                        ),
                      ),
                    ),
              itemCount: selectMeal.ingredients.length,
            )
          ),
          buildSectionTitle(context, "Steps "),
          buildContainer(ListView.builder(
              itemBuilder: (ctx,index)=>Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index+1}'),
                    ),
                    title: Text(selectMeal.steps[index]),
                  ),
                  Divider(color: Colors.grey),
                ],
              ),
            itemCount: selectMeal.steps.length,
          )),
        ],
      ),
    ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
         isFavorite( mealId) ? Icons.star :Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
