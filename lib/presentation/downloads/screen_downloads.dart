import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/presentation/widgets/app_bar-widget.dart';


class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);
  final List imageList = [
    "https://www.themoviedb.org/t/p/w220_and_h330_face/muUfmoA92F2y15wc3XPYW5jFqQi.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/tw0lXhbNkklvseuJ4aYldkVyXV7.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/pE8CScObQURsFZ723PSW1K9EGYp.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: AppBarWidget(title: "Downloads"),
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const _SmartDownloads(),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Introducing Downloads for you",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          // const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "We will download a personalized selection of\nmovies and shows for you,so there's\nalways something to watch on your\ndevice",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          // const SizedBox(height: 20,),
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.30,
                backgroundColor: Colors.grey[800],
              ),
              DownloadsImageWidget(
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 130, bottom: 50, top: 30),
                angle: 20,
                size: Size(size.width * 0.37, size.width * 0.40),
              ),
              DownloadsImageWidget(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 130, bottom: 50, top: 30),
                angle: -20,
                size: Size(size.width * 0.37, size.width * 0.40),
              ),
              DownloadsImageWidget(
                imageList: imageList[2],
                margin: const EdgeInsets.only(bottom: 10, top: 30),
                size: Size(size.width * 0.38, size.width * 0.47),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
            child: MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Set up",
                  style: TextStyle(
                      color: whitecolor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              color: Colors.indigo,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60, top: 10),
            child: MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "See What you can download",
                  style: TextStyle(
                      color: blackcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              color: whitecolor,
            ),
          )
        ],
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(Icons.settings, color: whitecolor),
        kWidth,
        Text(
          "Smart Downloads",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    required this.margin,
    required this.size,
    this.angle = 0,
    this.radius = 10,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(imageList))),
      ),
    );
  }
}
