import 'package:flutter/material.dart';
import 'enums.dart';

class AppConfig extends InheritedWidget {
  AppConfig({this.envType, this.appInternalId, required Widget child}) : super(child: child);

  final EnvironmentType? envType;
  final int? appInternalId;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}