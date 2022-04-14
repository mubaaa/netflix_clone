import 'package:flutter/material.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/presentation/search/screen_search.dart';
import 'package:netflix_project/presentation/search/widgets/title.dart';


class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Heading(title: "Movies & TV"),
        kheight,
        Expanded(
            child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 1/1.4,
                shrinkWrap: true,
                children: List.generate(20, (index) {
                  return MainCard();
                })))
      ],
    );
  }
}
class MainCard extends StatelessWidget {
  const MainCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imagecard)),
         borderRadius:BorderRadius.circular(7) ),
    
    );
  }
}
