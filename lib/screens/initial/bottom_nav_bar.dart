
import 'package:akrom_malik_flutter/screens/initial/audio_book_list_page.dart';
import 'package:akrom_malik_flutter/screens/initial/book_list_page.dart';
import 'package:akrom_malik_flutter/screens/initial/home_page.dart';
import 'package:akrom_malik_flutter/screens/initial/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<BottomNavigationBarItem> _bottomNavigationBarItems = [
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.book), label: "Book"),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.music_albums), label: "Audiobooks"),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: "Profile"),
];

List<Widget> _pageList = [
  HomePage(),
  BookListPage(),
  AudioBookPage(),
  ProfileUI(),
];

List<Widget> get getPageList => _pageList;
List<BottomNavigationBarItem> get getBottomNavigationBarItems => _bottomNavigationBarItems;