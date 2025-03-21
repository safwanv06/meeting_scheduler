import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../main.dart';
import 'dashboard_bottom_icon.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget(
      {super.key, required this.onTap, required this.selectedIndex});

  final Function(int index) onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: appSize.size16.h,
          left: appSize.size8.w,
          right: appSize.size8.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(appSize.radius16),
        child: Container(
            color: appColors.grey36454F,
            padding: EdgeInsets.symmetric(vertical: appSize.size16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardBottomIcon(
                  onTap: () {
                    onTap(0);
                  },
                  icon: Icons.home,
                  isSelected: selectedIndex == 0,
                ),
                DashboardBottomIcon(
                  onTap: () {
                    onTap(1);
                  },
                  icon: Icons.handshake_outlined,
                  isSelected: selectedIndex == 1,
                ),
                DashboardBottomIcon(
                  onTap: () {
                    onTap(2);
                  },
                  icon: Icons.calendar_month,
                  isSelected: selectedIndex == 2,
                ),
                DashboardBottomIcon(
                  onTap: () {
                    onTap(3);
                  },
                  icon: Icons.support_agent,
                  isSelected: selectedIndex == 3,
                ),
                DashboardBottomIcon(
                  onTap: () {
                    onTap(4);
                  },
                  icon: Icons.person_2_outlined,
                  isSelected: selectedIndex == 3,
                ),
              ],
            )),
      ),
    );
  }
}
