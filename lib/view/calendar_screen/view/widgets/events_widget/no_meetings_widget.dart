import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../main.dart';

class NoMeetingsWidget extends StatelessWidget {
  const NoMeetingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Divider(color: appColors.greyA9A9A9, thickness: 0.5.sp)),
        SizedBox(width: appSize.size4.w),
        Text("No Scheduled Meetings",
            style: GoogleFonts.inter(
                color: appColors.greyA9A9A9,
                fontWeight: FontWeight.w400,
                fontSize: appSize.font10)),
        SizedBox(width: appSize.size4.w),
        Expanded(child: Divider(color: appColors.greyA9A9A9, thickness: 0.5.sp))
      ],
    );
  }
}
