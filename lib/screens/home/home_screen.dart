/*

  Created by: Bakhromjon Polat
  Created on: May 13 2023 00:56:55
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:akrom_malik_flutter/screens/home/bloc/bottom_nav_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pages = <Widget>[];

  @override
  void initState() {
    super.initState();
    _pages.addAll(
      const [
        SizedBox(),
        SizedBox(),
        SizedBox(),
        SizedBox(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    int index = context.watch<BottomNavBarBloc>().state;
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: _pages,
      ),
    );
  }
}