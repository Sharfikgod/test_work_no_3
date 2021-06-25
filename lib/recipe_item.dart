import 'package:flutter/material.dart';
import "string_extension.dart";

class RecipeItem extends StatelessWidget {
  final int id;
  final String name;
  final String urlPictures;
  final String description;

  RecipeItem(
    this.id,
    this.name,
    this.urlPictures,
    this.description,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 80,
                child: Image.network(
                  urlPictures,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name.capitalizeFirstofEach,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          id.toString().padLeft(2, '0'),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 180,
                      child: Text(
                        description,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
