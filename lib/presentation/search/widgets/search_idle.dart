import 'package:flutter/material.dart';
import 'package:netflix_project/api/api_function.dart/function.dart';
import 'package:netflix_project/api/model_class/user.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/presentation/search/widgets/title.dart';

 const imgageUrl = 
    "https://www.themoviedb.org/t/p/w500_and_h282_face/4OTYefcAlaShn6TGVK33UxLW9R7.jpg";
class SearchIdleWidget extends StatelessWidget {
 const  SearchIdleWidget({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
       const Heading(title: "Top Searches"),
        kheight,
        Expanded(
          child:FutureBuilder(
            future: HttpService().getReq(),
            builder: (context,AsyncSnapshot<User?> snapshot) {
              if (snapshot.hasData) {
  return ListView.separated(
    shrinkWrap: true,
    itemBuilder: (ctx,index)=>const TopSearchTile(),
   separatorBuilder: (ctx,index)=>kheight,
   itemCount: 10);
}else{
  return const Center(child: CircularProgressIndicator(),);
}
            }
          ),
        )
      ],
    );
  }
}


class TopSearchTile extends StatelessWidget {
  const TopSearchTile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth *0.35,
          height: 70,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imgageUrl))
          ),
        ),
        const Expanded(child: Padding(
          padding: EdgeInsets.only(left: 6),
          child: Text("The KingsMan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),),
        )),
      const  Icon(Icons.play_circle_fill,
        size: 40,
        color: Colors.grey,)
      ],
      
    );
  }
}