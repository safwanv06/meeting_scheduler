import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_sync/view/calendar_screen/controller/controller.dart';
import 'package:provider/provider.dart';

import 'constants/api_routes/api_routes.dart';
import 'constants/app_routes/app_routes.dart';
import 'constants/app_theme/app_colors.dart';
import 'constants/app_theme/app_size.dart';
import 'constants/app_theme/font_styles.dart';
import 'constants/image_data/image_data.dart';
import 'utils/middleware/shared_data_handler/shared_data_handler.dart';

AppRoutes appRoutes = AppRoutes();
ApiRoutes apiRoutes = ApiRoutes();
SharedDataHandler sharedDataHandler = SharedDataHandler();
FontStyles fontStyles = FontStyles();
AppColors appColors = AppColors();
AppSize appSize = AppSize();
ImageData imageData = ImageData();
IconsData iconData = IconsData();
OtherData otherData = OtherData();
ScreenUtil screenUtil = ScreenUtil();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(milliseconds: 1000));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 854),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => CalenderController()),
          ],
          child: MaterialApp(
            title: 'Meet Sync',
            theme: ThemeData(
              scaffoldBackgroundColor: appColors.black000000,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            routes: routes,
            initialRoute: appRoutes.dashBoard,
          ),
        ),);
  }
}
