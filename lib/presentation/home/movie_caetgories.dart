import 'package:flutter/material.dart';
import 'package:netflix_project/api/api_url/appi_url.dart';
import 'package:netflix_project/core/constants.dart';


class MovieCategories extends StatelessWidget {
  final String title;
  final Widget future_Builder;
  MovieCategories({Key? key, required this.title,required this.future_Builder}) : super(key: key);
  Constantss obj2 = Constantss();
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: 150,
          child: future_Builder 
        ),
      ],
    );
  }
}
