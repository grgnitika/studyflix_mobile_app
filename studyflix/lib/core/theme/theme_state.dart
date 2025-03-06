import 'package:flutter/material.dart';

@immutable
abstract class ThemeState {
  final bool isDarkMode;

  const ThemeState(this.isDarkMode);
}

class ThemeInitial extends ThemeState {
  const ThemeInitial(super.isDarkMode);
}

class ThemeUpdated extends ThemeState {
  const ThemeUpdated(super.isDarkMode);
}
