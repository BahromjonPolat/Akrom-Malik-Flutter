import 'package:akrom_malik_flutter/screens/initial/book_page.dart';
import 'package:akrom_malik_flutter/screens/initial/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  late Size _size;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: _getBottomNavigationBar(),
      body: SafeArea(child: getPageList[_currentIndex]),
    );
  }

  BottomNavigationBar _getBottomNavigationBar() => BottomNavigationBar(
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        items: getBottomNavigationBarItems,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      );
}
