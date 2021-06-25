import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'model_api.dart';

class ApiRecipe with ChangeNotifier {
  List<ModelApi> _items = [];

  List<ModelApi> get items {
    return [..._items];
  }

  Future<void> getRecipes() async {
    try {
      final url =
          'https://raw.githubusercontent.com/ababicheva/FlutterInternshipTestTask/main/recipes.json';
      final response = await http.get(url);
      final List<ModelApi> loadedImages = [];
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((data) {
        loadedImages.add(
          ModelApi(
            id: data['id'],
            name: data['name'],
            urlPicture: data['picture'],
            description: data['description'],
          ),
        );
      });

      loadedImages.sort((a, b) => a.id.compareTo(b.id));

      _items = loadedImages;
      notifyListeners();
    } catch (er) {
      throw (er);
    }
  }
}
