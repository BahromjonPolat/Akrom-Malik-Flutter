/*

  Created by: Bakhromjon Polat
  Created on: May 13 2023 22:31:07
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:akrom_malik_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() => ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: AppColors.background,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.darkGrey,
        backgroundColor: AppColors.lightGreen,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
        type: BottomNavigationBarType.fixed,
      ),
    );
