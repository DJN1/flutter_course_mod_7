import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  final Function _saveFilters;
  final Map<String, bool> _filters;

  FiltersScreen(this._saveFilters, this._filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget._filters['gluten'];
    _vegetarian = widget._filters['vegetarian'];
    _vegan = widget._filters['vegan'];
    _lactoseFree = widget._filters['lactose'];
  }

  Widget _buildSwitchListTile(
    String title,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text('Only include ${title.toLowerCase()} meals'),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget._saveFilters({
                  'gluten': _glutenFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                  'lactose': _lactoseFree,
                });
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile('Gluten-free', _glutenFree, (value) {
                  setState(
                    () {
                      _glutenFree = value;
                    },
                  );
                }),
                _buildSwitchListTile('Vegetarian', _vegetarian, (value) {
                  setState(
                    () {
                      _vegetarian = value;
                    },
                  );
                }),
                _buildSwitchListTile('Vegan', _vegan, (value) {
                  setState(
                    () {
                      _vegan = value;
                    },
                  );
                }),
                _buildSwitchListTile('Lactose-free', _lactoseFree, (value) {
                  setState(
                    () {
                      _lactoseFree = value;
                    },
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
