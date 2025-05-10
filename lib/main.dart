import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/notification/notification.dart';
import 'package:shopapp/provider/main_view_provider.dart';
import 'package:shopapp/provider/product_provider.dart';
import 'package:shopapp/provider/shoe_provider.dart';
import 'package:shopapp/views/splash_view.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await NotificationService.init();

  // 🔁 Start the repeating notifications
  // startRepeatingNotifications(); 

  tz.initializeTimeZones();

  
  await Hive.openBox("cart_box");
  await Hive.openBox("fav_box");



  runApp(const MyApp());
}
void startRepeatingNotifications() {
  // Timer.periodic(const Duration(seconds: 55), (timer) {
  //   final scheduledTime = DateTime.now().add(const Duration(seconds: 2)); // Add slight delay to avoid past time
  //   NotificationService.scheduleNotification(
  //     timer.tick, // unique id each time
  //     "Repeating Notification",
  //     "This message repeats every 55 seconds.",
  //     scheduledTime,
  //   );
  // });
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainViewProvider()),
        ChangeNotifierProvider(create: (context) => ShoeProvider()),
  
        ChangeNotifierProvider(create: (context) => ProductNotifier()),
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


