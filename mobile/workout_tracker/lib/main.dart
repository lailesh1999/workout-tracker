import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/ui/main/ui/screens/app_main.dart';

import 'core/const/constants.dart';
import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocator();
  runApp(ProviderScope(child: MyApp()));
}

// botToaster is used to show toast Message...
final botToastBuilder = BotToastInit();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: Constants.appName,
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            widget = botToastBuilder(context, widget);
            return widget!;
          },
          navigatorObservers: [BotToastNavigatorObserver()],
          home: const AppMain(),
        );
      },
    );
  }
}


