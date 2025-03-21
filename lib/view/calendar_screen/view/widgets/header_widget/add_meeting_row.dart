import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_sync/view/calendar_screen/view/widgets/header_widget/option_widget.dart';

import '../../../../../main.dart';

class AddMeetingRow extends StatelessWidget {
  const AddMeetingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Meeting List",
          style: fontStyles.font16GreyA9A9_600,
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.all(appSize.size8.sp),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: appColors.yellowFFE11D.withValues(alpha: 0.4)),
          child: Icon(
            Icons.add,
            size: appSize.icon20,
            color: appColors.greyA9A9A9,
          ),
        )
      ],
    );
  }
}
