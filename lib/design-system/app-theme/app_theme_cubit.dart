import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:untitled/design-system/theme.dart';

part 'app_theme_state.dart';


class ThemeState {
  final ThemeData themeData;
  final bool isDarkMode;

  ThemeState({required this.themeData, this.isDarkMode = false});
}

class ThemeCubit extends Cubit<ThemeState> {
  bool isDarkMode = false;

  ThemeCubit() : super(ThemeState(themeData: lightTheme));

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    emit(_getThemeState());
  }

  void updateUserRole(bool isDark) {
    emit(_getThemeState());
  }

  ThemeState _getThemeState() {

    if (isDarkMode) {
      return ThemeState(
        themeData: darkTheme,
      );
    } else {

      return ThemeState(
        themeData: lightTheme,
        // isDarkMode: isDarkMode
      );
    }
  }
}
