import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/notification/notification.dart';
import 'package:shopapp/provider/main_view_provider.dart';
import 'package:shopapp/provider/shoe_provider.dart';
import 'package:shopapp/views/splash_view.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await NotificationService.init();
  tz.initializeTimeZones();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainViewProvider()),
        ChangeNotifierProvider(create: (context) => ShoeProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
          // primaryColor: AppColor.primary,
          useMaterial3: true,
        ),
        home: const SplashView(),
      ),
    );
  }
}


