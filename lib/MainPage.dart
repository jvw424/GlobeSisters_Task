import 'dart:ffi';

import 'package:emulate/FeedPage.dart';
import 'package:emulate/PostPage.dart';
import 'package:emulate/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'modules/User.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;

  List<String> pageNames = ['Feed Page', 'Post Page', 'Profile Page'];

  final pages = [
    FeedPage(),
    PostPage(),
    ProfilePage(
      user: User(
          birthday: DateTime(1999, 11, 2),
          email: 'jvw424@gmail.com',
          imagePath: 'headshot.png',
          interests: ['Camping', 'Biking', 'Sports'],
          name: 'Joseph Williams',
          phoneNumber: 6199170804,
          currentLocation: 'Berkeley, California',
          locations: [
            Tuple2('Palmer, Alaska', true),
            Tuple2('San Diego, California', true),
            Tuple2('Florence, Italy', false)
          ]),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(pageNames[pageIndex]),
        ),
        body: IndexedStack(
          index: pageIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blueGrey[200],
            selectedItemColor: Colors.black87,
            unselectedItemColor: Colors.black38,
            showUnselectedLabels: false,
            currentIndex: pageIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (idx) {
              setState(() {
                pageIndex = idx;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.feed),
                label: 'Feed',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.post_add), label: 'Post'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ]));
  }
}
