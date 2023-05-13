/*

  Created by: Bakhromjon Polat
  Created on: May 13 2023 01:03:15
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:bloc/bloc.dart';

// part 'bottom_nav_bar_event.dart';
// part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<int, int> {
  BottomNavBarBloc() : super(0) {
    on<int>((event, emit) => emit(event));
  }
}
