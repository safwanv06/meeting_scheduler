import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meet_sync/main.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({super.key, required this.icon, this.enableBadge});

  final IconData icon;
  final bool? enableBadge;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(appSize.size8.sp),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: appColors.grey36454F),
      child: enableBadge == true
          ? Badge(
              label: Text(
                "3",
                style: GoogleFonts.inter(
                    color: appColors.whiteFFFFFF,
                    fontSize: appSize.font10,
                    fontWeight: FontWeight.normal),
              ),
              child: Icon(
                icon,
                size: appSize.icon20,
                color: appColors.yellowFFE11D.withValues(alpha: 0.8),
              ),
            )
          : Icon(
              icon,
              size: appSize.icon20,
              color: appColors.yellowFFE11D.withValues(alpha: 0.8),
            ),
    );
  }
}
