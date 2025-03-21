import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class NoDataPage extends StatelessWidget {
  const NoDataPage({super.key,this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.sp),
      child: Center(
        child: Text(message??"No Data",
            textAlign: TextAlign.center),
      ),
    );
  }
}