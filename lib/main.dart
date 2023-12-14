import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pray/models/namaz_model.dart';
import 'package:pray/models/savesetting_model.dart';
import 'package:pray/models/zekr_model.dart';
import 'package:pray/screens/home_screen.dart';
import 'package:flutter/services.dart';





void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NamazAdapter());
  Hive.registerAdapter(ZekrAdapter());
  Hive.registerAdapter(SettingAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  firsttime();
  /// amoodi kardane barname dar 4 khat
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    Hive.openBox('Zekr');
    Hive.openBox('Namaz');
    Hive.openBox('Setting');
    return  const MaterialApp(

      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );

  }

}
firsttime()async {
  var box = await Hive.openBox('Namaz');
  Namaz firstnamaz = Namaz(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (box.values.isEmpty) {
    await box.add(firstnamaz);
  }
    ///-------------------------------------------------------------------------
    var box1 = await Hive.openBox('Zekr');
    Zekr firstzekr = Zekr(0);
    if (box1.values.isEmpty) {
      await box1.add(firstzekr);
    }
    ///-------------------------------------------------------------------------

  var box2 = await Hive.openBox('Setting');
  Setting firstSetting = Setting(false, true, true);
  if (box2.values.isEmpty) {
    await box2.add(firstSetting);
  }
}
