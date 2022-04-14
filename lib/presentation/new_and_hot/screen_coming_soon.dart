import 'package:flutter/material.dart';
import 'package:netflix_project/api/api_function.dart/function.dart';
import 'package:netflix_project/api/model_class/upcoming.dart';
import 'package:netflix_project/core/colors.dart';
import 'package:netflix_project/core/constants.dart';

import 'package:netflix_project/presentation/widgets/app_bar-widget.dart';

final List<String> movieDetails = ['Comic', 'Drama', 'Periodic Piece', 'US'];

class ScreenComingSoon extends StatelessWidget {
  const ScreenComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const PreferredSize(
        child: AppBarWidget(
          title: 'Coming Soon',
        ),
        preferredSize: Size(
          double.infinity,
          100,
        ),
      ),
      body: FutureBuilder(
          future: HttpService().upcoming(),
          builder: (BuildContext context, AsyncSnapshot<Upcoming?> snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, index) => kWidth,
                itemCount: snapshot.data!.results.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data!.results[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kheight,
                        Text(
                          data.originalTitle,
                          style: TextStyle(
                            color: whitecolor,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        space,
                        Text(
                          data.overview,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text(
                             "Rating: ${data.voteAverage.toString()}%",
                              style: const TextStyle(
                                  color: whitecolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                            SizedBox(height: 10,),
                        SizedBox(
                          width: size.width,
                          height: size.height * 0.3,
                          child: Stack(
                            children: [
                              Container(
                                width: size.width,
                                height: size.height * 0.3,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://www.themoviedb.org/t/p/original${data.posterPath}"),
                                  ),
                                ),
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: whitecolor,
                                    child: CircleAvatar(
                                      radius: 28,
                                      backgroundColor: blackcolor,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.play_arrow,
                                          color: whitecolor,
                                          size: 30,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  backgroundColor: blackcolor,
                                  radius: 20,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.volume_off,
                                      color: whitecolor,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        space,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              width: 90,
                              height: 50,
                              image: NetworkImage(
                                  "https://www.themoviedb.org/t/p/original${data.backdropPath}"),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon:
                                          const Icon(Icons.notifications_none),
                                      color: whitecolor,
                                      iconSize: 30,
                                    ),
                                    const Text(
                                      "Remind Me",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    )
                                  ],
                                ),
                                kWidth,
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.info_outlined,
                                        color: whitecolor,
                                      ),
                                      iconSize: 30,
                                    ),
                                    const Text(
                                      "Info",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ],
                                ),
                                kWidth
                              ],
                            ),
                          ],
                        ),
                        space,
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
