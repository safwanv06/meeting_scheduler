import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../main.dart';

class DashboardBottomIcon extends StatelessWidget {
  const DashboardBottomIcon(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.isSelected});

  final Function() onTap;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Icon(
        icon,
        size: appSize.icon20,
        color: isSelected ? appColors.yellowFFE11D : appColors.greyA9A9A9,
      ),
    );
  }
}
