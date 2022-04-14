
import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors.dart';
import 'package:netflix_project/core/constants.dart';


class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //leftside
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                    radius: 30,
                    child: IconButton(
                        onPressed: () {}, 
                        icon: const Icon(Icons.volume_off,
                        color: whitecolor,
                        size: 30,))),
                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/peaky-blinders-1614180392.jpg"),
                    ),
                    kheight,
                  VideoReactions(icon: Icons.emoji_emotions, title: "LOL"),
                   VideoReactions(icon: Icons.add, title: "My List"),
                    VideoReactions(icon: Icons.share, title: "Share"),
                     VideoReactions(icon: Icons.play_arrow, title: "Play"),

                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoReactions extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoReactions({Key? key,required this.icon,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        children: [
          Icon(icon,
          color: whitecolor,
          size: 30,),
          Text(title,
          style:const TextStyle(
            fontSize: 16
          ),)
        ],
      ),
    );
  }
}
