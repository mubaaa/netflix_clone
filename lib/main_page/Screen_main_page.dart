
import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors.dart';
import 'package:netflix_project/main_page/bottom_navigation.dart';
import 'package:netflix_project/presentation/downloads/screen_downloads.dart';
import 'package:netflix_project/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_project/presentation/home/screen_home.dart';
import 'package:netflix_project/presentation/new_and_hot/screen_coming_soon.dart';
import 'package:netflix_project/presentation/search/screen_search.dart';




class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

final _pages = [
const ScreenHome(),
const ScreenComingSoon(),
const ScreenFastLaugh(),
const ScreenSearch(),
ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (BuildContext context, dynamic index, Widget? _) {
              return _pages[index];
            }),
      ),
      bottomNavigationBar: BottomNNavigationWidget(),
    );
  }
}
