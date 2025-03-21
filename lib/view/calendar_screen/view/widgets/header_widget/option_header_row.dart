import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_sync/main.dart';
import 'package:meet_sync/view/calendar_screen/view/widgets/header_widget/option_widget.dart';

class OptionHeaderRow extends StatelessWidget {
  const OptionHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OptionWidget(
          icon: Icons.area_chart_rounded,
        ),
        SizedBox(width: appSize.size8.w),
        OptionWidget(
          icon: Icons.mail_outline,
        ),
        SizedBox(width: appSize.size8.w),
        OptionWidget(
          icon: Icons.notifications_active_outlined,
          enableBadge: true,
        ),
        SizedBox(width: appSize.size8.w),
        OptionWidget(
          icon: Icons.menu,
        ),
      ],
    );
  }
}
