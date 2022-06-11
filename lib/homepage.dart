// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fimage/pages/favoriteimages.dart';
import 'package:fimage/pages/listofimages.dart';
import 'package:fimage/pages/mainpage.dart';
import 'package:fimage/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _navigate(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _listOfPages = [
    MainPage(),
    ListOfImages(),
    FavoriteImages()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _listOfPages[_selectedIndex],
        appBar: AppBar(
          backgroundColor: AppStyle.secondColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Fimage',
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppStyle.secondColor,
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.white60,
            selectedItemColor: Colors.white,
            onTap: _navigate,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.photo_library), label: 'Photos'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites')
            ]));
  }
}
