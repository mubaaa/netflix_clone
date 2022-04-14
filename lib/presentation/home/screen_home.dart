import 'package:flutter/material.dart';
import 'package:netflix_project/api/api_function.dart/function.dart';
import 'package:netflix_project/api/api_url/appi_url.dart';
import 'package:netflix_project/api/model_class/popular.dart';
import 'package:netflix_project/api/model_class/Nowplaying.dart';
import 'package:netflix_project/api/model_class/user.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/presentation/home/movie_caetgories.dart';
import 'package:netflix_project/presentation/home/navigator.dart/details.dart';
import 'package:netflix_project/presentation/home/navigator.dart/now.dart';
import 'package:netflix_project/presentation/home/navigator.dart/poplar.dart';



class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  Constantss obj = Constantss();
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              floating: true,
              title: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tv Shows',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Movies',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: const [
                          Text(
                            'Categories',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              leading: Image.asset("assets/netflix.png"),
              backgroundColor: Colors.transparent,
              expandedHeight: 450,
              actions: [
                Row(
                  children: [
                    Icon(Icons.cast),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/smile.png",
                      scale: 14,
                    ),
                    kWidth
                  ],
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  obj.mainImage,
                  fit: BoxFit.fill,
                ),
              ),
              toolbarHeight: 70,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 0,
                      color: Colors.black,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Action',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              kWidth,
                              Icon(
                                Icons.fiber_manual_record,
                                size: 5,
                                color: Colors.white,
                              ),
                              kWidth,
                              Text(
                                'Adventure',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              Text('My List',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))
                            ],
                          ),
                          Container(
                            color: Colors.white,
                            width: 80,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.play_arrow),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Play',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: const [
                              Icon(Icons.info_outlined, color: Colors.white),
                              Text('Info',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))
                            ],
                          ),
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                    MovieCategories(
                      title: "Popular on Netflix",
                      future_Builder: FutureBuilder(
                        future: HttpService().getReq(),
                        builder: (BuildContext context,
                            AsyncSnapshot<User?> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                final data = snapshot.data!.results[index];
                                print({data.originalLanguage});
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Details(
                                          ind: index,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: screenwidth * 0.3,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://www.themoviedb.org/t/p/original${data.posterPath}"),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => kWidth,
                              itemCount: snapshot.data!.results.length,
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    MovieCategories(
                      title: "Now Playing",
                      future_Builder: FutureBuilder(
                        future: HttpService().nowPlaying(),
                        builder: (BuildContext context,
                            AsyncSnapshot<NowPlaying?> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                final data = snapshot.data!.results[index];
                                return GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NowPlat(ind: index),
                                      )),
                                  child: Container(
                                    width: screenwidth * 0.3,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://www.themoviedb.org/t/p/original${data.posterPath}")),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => kWidth,
                              itemCount: snapshot.data!.results.length,
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                    MovieCategories(
                      title: "Popular",
                      future_Builder: FutureBuilder(
                        future: HttpService().popular(),
                        builder: (BuildContext context,
                            AsyncSnapshot<Popular?> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                final data = snapshot.data!.results[index];
                                return GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PopularMovies(ind: index,),
                                      )),
                                  child: Container(
                                    width: screenwidth * 0.3,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://www.themoviedb.org/t/p/original${data.posterPath}")),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => kWidth,
                              itemCount: snapshot.data!.results.length,
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),

                    kheight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Top 10",
                            style: TextStyle(
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
                      child: FutureBuilder(
                        future: HttpService().getReq(),
                        builder: (BuildContext context,
                            AsyncSnapshot<User?> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                final data = snapshot.data!.results[index];
                                return SizedBox(
                                  width: screenwidth * 0.46,
                                  height: 150,
                                  child: Stack(
                                    children: [
                                      Text(
                                        "${index + 1}",
                                        style: const TextStyle(
                                            fontSize: 150,
                                            color: Colors.white,
                                            backgroundColor: Colors.black),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: screenwidth * 0.3,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://www.themoviedb.org/t/p/original${data.posterPath}")),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => kWidth,
                            );
                          } else {
                            return const Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
