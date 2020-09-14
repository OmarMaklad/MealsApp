import 'package:flutter/material.dart';
import 'package:flutter_app_shop/widgets/main_drawer.dart';

class  FiltersScreen extends StatefulWidget {
  static const nameRoute = '/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;
  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchTitle(
      String title,
      String description,
      bool currentValue,
      Function updateValue,
      ){
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue,

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed:()
              {
                final selectFilters ={
                  'gluten':_glutenFree,
                  'lactose':_lactoseFree,
                  'vegan' : _vegan,
                  'vegetarian' : _vegetarian,
                };
                widget. saveFilters(selectFilters);
              },
          ),
        ],
      ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Adjust Your Meal Selection",
              style: TextStyle(
                color: Colors.pink,
                fontSize: 20,
              ),
              ),
            ),
            _buildSwitchTitle(
                "Gluten-Free",
                "Only include Gluten-Free Meal",
                _glutenFree,
                (newValue){
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),

            _buildSwitchTitle(
                "Loctose-Free",
                "Only include Lactose-Free Meal",
                _lactoseFree,
                    (newValue){
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),

            _buildSwitchTitle(
                "Vegan-Free",
                "Only include Vegan-Free Meal",
                _vegan,
                    (newValue){
                  setState(() {
                    _vegan = newValue;
                  });
                }),

            _buildSwitchTitle(
                "Vegetarien-Free",
                "Only include Vegetarien-Free Meal",
                _vegetarian,
                    (newValue){
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),


          ],
        ),
    );
  }
}
