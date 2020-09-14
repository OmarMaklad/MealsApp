import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';


class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map(
              (catdata)=> CategoryItem(
                  catdata.id,
                  catdata.title,
                  catdata.color,
              ),
        ).toList(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20

        ),
    );
  }
}
