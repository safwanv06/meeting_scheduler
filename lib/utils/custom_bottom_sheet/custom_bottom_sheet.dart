import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

customBottomSheet(
    {required BuildContext context,
    required Widget child,
    required String title}) {
  return showBottomSheet(
      context: context,
      enableDrag: true,
      builder: (context) => Container(
            padding: EdgeInsets.all(appSize.size16.sp),
            width: double.infinity,
            decoration: BoxDecoration(
                color: appColors.grey36454F,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(appSize.radius24),
                    topRight: Radius.circular(appSize.radius24))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close_rounded,
                            color: appColors.greyA9A9A9,
                            size: appSize.icon24,
                          )),
                      const Spacer(),
                      Text(
                        title,
                        style: fontStyles.font16GreyA9A9_600,
                      ),
                      const Spacer()
                    ],
                  ),
                  SizedBox(
                    height: appSize.size8.h,
                  ),
                  Divider(
                    color: appColors.greyA9A9A9,
                  ),
                  SizedBox(
                    height: appSize.size8.h,
                  ),
                  child
                ],
              ),
            ),
          ));
}
