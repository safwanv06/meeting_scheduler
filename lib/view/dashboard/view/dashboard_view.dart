import 'package:flutter/material.dart';
import 'package:meet_sync/view/calendar_screen/view/calendar_view.dart';
import 'package:meet_sync/view/dashboard/view/widgets/bottom_bar_widget.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: 1,
          initialIndex: 0,
          child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [CalendarView()]),
        ),
        bottomNavigationBar: BottomBarWidget(
          onTap: (index) {},
          selectedIndex: 2,
        ));
  }
}
