import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_sync/main.dart';
import 'package:meet_sync/utils/shimmers/custom_shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: appSize.size20.h,
          ),
          ShimmerEffect.rectangle(width: double.infinity, height: 300.h),
          SizedBox(
            height: appSize.size20.h,
          ),
          Column(
            spacing: appSize.size10.h,
            children: [
              ShimmerEffect.rectangle(width: double.infinity, height: 70.h),
              ShimmerEffect.rectangle(width: double.infinity, height: 70.h),
              ShimmerEffect.rectangle(width: double.infinity, height: 70.h)
            ],
          ),
          SizedBox(
            height: appSize.size20.h,
          ),
        ],
      ),
    );
  }
}
