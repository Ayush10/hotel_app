import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_page/models/bottom_bar.dart';
import 'package:home_page/widgets/destination_corousel.dart';
import 'package:home_page/widgets/hotel_carousel.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

enum BottomIcons {
  Home,
  Favorite,
  Search,
  Account,
}

class _MainPageState extends State<MainPage> {
  BottomIcons bottomIcons = BottomIcons.Home;
  int _selectedIndex = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFE7EBEE),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 120,
              ),
              child: Text(
                "What would you like to find?",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 20.0,
            ),
            DestinationCarousel(),
            SizedBox(
              height: 20.0,
            ),
            HotelCarousel(),
            SizedBox(
              height: 20.0,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Home;
                        });
                      },
                      bottomIcons: bottomIcons == BottomIcons.Home ? true : false,
                      text: 'Home',
                      icons: EvaIcons.home,
                    ),
                    BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Favorite;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Favorite ? true : false,
                      text: 'Favorite',
                      icons: EvaIcons.heartOutline,
                    ),
                    BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Search;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Search ? true : false,
                      text: 'Search',
                      icons: EvaIcons.search,
                    ),
                    BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Account;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Account ? true : false,
                      text: 'Account',
                      icons: EvaIcons.personOutline,
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

// bottomIcons == BottomIcons.Home
// ?
//     : Container(),
// bottomIcons == BottomIcons.Favorite
// ? Center(
// child: Text(
// "Hi, this is favorites page",
// style: TextStyle(fontSize: 18),
// ),
// )
// : Container(),
// bottomIcons == BottomIcons.Search
// ? Center(
// child: Text(
// "Hi, this is search page",
// style: TextStyle(fontSize: 18),
// ),
// )
// : Container(),
// bottomIcons == BottomIcons.Account
// ? Center(
// child: Text(
// "Hi, this is account page",
// style: TextStyle(fontSize: 18),
// ),
// )
// : Container(),
