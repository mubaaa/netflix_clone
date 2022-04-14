import 'package:flutter/material.dart';
import 'package:netflix_project/api/api_function.dart/function.dart';
import 'package:netflix_project/api/model_class/popular.dart';
import 'package:netflix_project/api/model_class/upcoming.dart';

class PopularMovies extends StatefulWidget {
  final int ind;
  const PopularMovies({ Key? key, required this.ind }) : super(key: key);

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  @override
   Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(        
        slivers: [
          SliverAppBar(
            floating: true,
             automaticallyImplyLeading: false,
            expandedHeight: 300,
            backgroundColor: Colors.black,
            flexibleSpace: FutureBuilder(
              future: HttpService().popular(),
              builder: ((BuildContext context, AsyncSnapshot<Popular?> snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data!.results[widget.ind];
                  return Container(
                      // color: Colors.amber,
                      height: 500,
                      child: Image.network(
                        "https://www.themoviedb.org/t/p/original${data.backdropPath}",
                        fit: BoxFit.fill,
                      ));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.cast_rounded),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.cancel_outlined)
                  ],
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: FutureBuilder(
              future: HttpService().popular(),
              builder: (BuildContext context, AsyncSnapshot<Popular?> snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data!.results[widget.ind];
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                          // alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Movie_deatls(
                                  data,
                                  "Rating :",
                                  "${data.voteAverage.toString()}%",
                                  Colors.green),
                              const SizedBox(
                                height: 5,
                              ),
                              Movie_deatls(data, "Relesed Date :",
                                  data.releaseDate.toString(), Colors.white),
                              const SizedBox(
                                height: 5,
                              ),
                              Movie_deatls(
                                  data,
                                  "Lang :",
                                  " ${data.originalLanguage.toUpperCase()}",
                                  Colors.white)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Buttons(
                        context,
                        Colors.white,
                        const Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        const Text(
                          "Play",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Buttons(
                        context,
                        Color.fromARGB(255, 46, 45, 45),
                        const Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        const Text(
                          "Download",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data.overview,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis, 
                        ),
                        
                      ),
                      
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           Column(
                             children: const [
                               Icon(Icons.add,color: Colors.white,),
                               Text("My List")
                             ],
                           ),
                            Column(
                             children: const [
                               Icon(Icons.thumb_up,color: Colors.white,),
                               Text("Rate")
                             ],
                           ),
                            Column(
                             children: const [
                               Icon(Icons.share,color: Colors.white,),
                               Text("Share")
                             ],
                           )
                        ],
                      )
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Padding Buttons(BuildContext context, Color color, Widget icon, Widget text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        width: MediaQuery.of(context).size.width / 1,
        child: TextButton.icon(onPressed:(){}, icon: icon, label: text),
      ),
    );
  }

  Row Movie_deatls( data, String text1, String text2, Color color) {
    return Row(
      children: [
        Text(text1),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            text2,
            style: TextStyle(color: color),
          ),
        ),
      ],
    );
  }
}