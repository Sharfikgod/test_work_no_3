import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/api_recipe.dart';
import '../recipe_item.dart';


class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Future<void> _refreshRecipes(BuildContext context) async {
    await Provider.of<ApiRecipe>(context, listen: false).getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Recipes'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _refreshRecipes(context),
        builder: (ctx, res) => res.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () => _refreshRecipes(context),
                child: Consumer<ApiRecipe>(
                  builder: (ctx, recipesData, _) => Padding(
                    padding: EdgeInsets.all(8),
                    child: ListView.builder(
                      itemCount: recipesData.items.length,
                      itemBuilder: (_, i) => Column(
                        children: <Widget>[
                          RecipeItem(
                            recipesData.items[i].id,
                            recipesData.items[i].name,
                            recipesData.items[i].urlPicture,
                            recipesData.items[i].description,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
