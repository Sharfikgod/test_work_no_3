import 'package:flutter/foundation.dart';

class ModelApi with ChangeNotifier {
  final int id;
  final String name;
  final String urlPicture;
  final String description;

  ModelApi({
    @required this.id,
    @required this.name,
    @required this.urlPicture,
    @required this.description,
  });
}
