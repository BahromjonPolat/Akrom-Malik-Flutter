/*

  Created by: Bakhromjon Polat
  Created on: May 13 2023 01:07:36
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:akrom_malik_flutter/core/constants/constants.dart';
import 'package:akrom_malik_flutter/screens/home/bloc/bottom_nav_bar_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    int index = context.watch<BottomNavBarBloc>().state;
    return BottomNavigationBar(
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book),
          label: 'Books',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.music_albums),
          label: 'Audio',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings),
          label: 'Settings',
        ),
      ],
      onTap: (value) {
        BlocProvider.of<BottomNavBarBloc>(context).add(value);
      },
    );
  }
}
