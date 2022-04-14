import 'package:flutter/material.dart';
import 'package:netflix_project/core/constants.dart';


class AppBarWidget extends StatelessWidget {
 const AppBarWidget({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
           Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(
            Icons.cast,
            color: Colors.white,
            size: 27,
          ),
          kWidth,
          Image.asset("assets/smile.png",scale: 14,),
          kWidth,
        ],
      ),
    );
  }
}
