import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screen/menu_screen.dart';
import 'api/api_recipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ApiRecipe(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: MenuScreen(),
      ),
    );
  }
}
