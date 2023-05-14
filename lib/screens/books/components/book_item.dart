/*

  Created by: Bakhromjon Polat
  Created on: May 14 2023 08:57:22
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:akrom_malik_flutter/routing/app_navigation.dart';
import 'package:akrom_malik_flutter/routing/app_route_names.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.pushNamed(RouteNames.reading);
      },
      child: SizedBox(
        width: 120.0,
        height: 240.0,
        child: Column(
          children: [
            Image.network(
              'https://i.pinimg.com/736x/63/af/d9/63afd9e7ca7ccb22c855e46270d01c93.jpg',
              fit: BoxFit.cover,
              width: 120.0,
              height: 180.0,
            ),
            const Text('Jangchi'),
          ],
        ),
      ),
    );
  }
}
