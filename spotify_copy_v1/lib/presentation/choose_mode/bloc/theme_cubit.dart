import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) {
    return emit(themeMode);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    switch (json['theme']) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    switch (state) {
      case ThemeMode.light:
        return {'theme': 'light'};
      case ThemeMode.dark:
        return {'theme': 'dark'};
      default:
        return {'theme': 'system'};
    }
  }
}
