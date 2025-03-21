import 'package:flutter/material.dart';
import 'package:meet_sync/main.dart';
import 'package:meet_sync/view/dashboard/view/dashboard_view.dart';

class AppRoutes {
  String dashBoard = "dashBoard";
}

Map<String, WidgetBuilder> routes = {
  appRoutes.dashBoard: (context) => DashboardView(),

};
