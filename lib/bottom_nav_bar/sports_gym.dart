import 'package:flutter/material.dart';
import 'package:sports_gym/models/sport.dart';
import 'package:sports_gym/pages/calendar_page.dart';
import 'package:sports_gym/pages/classification_page.dart';
import 'package:sports_gym/pages/profile_page.dart';
import 'package:sports_gym/pages/sports_page.dart';
import 'package:sports_gym/resources/strings.dart';

import '../resources/images.dart';

class SportsGym extends StatefulWidget {
  const SportsGym({
    Key? key,
    required this.onThemeModePressed,
  }) : super(key: key);

  final VoidCallback onThemeModePressed;

  @override
  _SportsGymState createState() => _SportsGymState();
}

class _SportsGymState extends State<SportsGym> {
  
  final pageController = PageController();
  int currentPage = 0;

  final sports = const [
    Sport(name: Strings.football, icon: Icons.sports_football, cover: Images.football),
    Sport(name: Strings.basketball, icon: Icons.sports_basketball, cover: Images.basketball),
    Sport(name: Strings.hockey, icon: Icons.sports_hockey, cover: Images.hockey),
  ];


  // final tabs =  const [
  //             Tab(icon: Icon(Icons.sports_football)),
  //             Tab(icon: Icon(Icons.sports_basketball),),
  //             Tab(icon: Icon(Icons.sports_hockey),),
  //           ];

  void onItemPressed(int index) {
    pageController.jumpToPage(index);
    setState(() {
      currentPage = index;
    });
  }

   void onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: sports.length,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(Strings.appName),
            actions: [
              IconButton(
                onPressed: widget.onThemeModePressed,
                icon: Icon(
                  theme.brightness == Brightness.light
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
              )
            ],
            bottom: currentPage == 0 ? TabBar(tabs: sports.map((sport) => Tab(icon: Icon(sport.icon))).toList(),
            indicatorColor: Colors.white,
            indicatorWeight: 1.5,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
            ) : null,
          ),
          body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: onPageChanged,
            
            children: [
              SportsPage(sports: sports,),
              const ClassificationPage(),
              const CalendarPage(),
              const ProfilePage(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.share),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              currentIndex: currentPage,
              onTap: onItemPressed,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports),
                  label: Strings.sports,
                  // backgroundColor: Colors.blue,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: Strings.ranking,
                  // backgroundColor: Colors.green,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: Strings.calendar,
                  // backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: Strings.profile,
                  // backgroundColor: Colors.pink,
                ),
              ],
            ),
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

 
}
