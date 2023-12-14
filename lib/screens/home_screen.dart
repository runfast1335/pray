import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pray/constants/colocr_constants.dart';
import 'package:pray/screens/zekr_shomar.dart';
import 'package:pray/screens/rakat_shomar.dart';
import 'package:pray/widgets/btn_menu.dart';
import 'namaz_shomar.dart';




class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    Hive.openBox('Zekr');
    Hive.openBox('Namaz');
    Hive.openBox('Setting');
    Color backgroundcolor =
    dayornight == true ? daybackgroundwhite : nightbackgroundwhite;
    Color tabbar = dayornight == true ? dayblue : nightblue;
    Color colortext= dayornight==true? daytextblack:nighttextwhite ;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage(
                'assets/images/homebackground.png',
              ),
              fit: BoxFit.fill,
              opacity: dayornight == true ? 0.4 : 0.08),
          color: backgroundcolor,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: tabbar,
            actions: [
              IconButton(
                padding: const EdgeInsets.only(right: 10),
                icon: Icon(
                    dayornight == true ? CupertinoIcons.moon :Icons.sunny,color: colortext,),
                onPressed: () {
                  dayornight=!dayornight;
                  settingsave();
                  setState(() { });

                },
              ),
            ],
          ),
          ///----------------Drawer is hear---------------------
          // drawer: Drawer(
          //   backgroundColor: tabbar,
          //   shape: const Border(
          //     right: BorderSide(style: BorderStyle.solid),
          //   ),
          //   child: const Column(
          //     children: [
          //       DrawerHeader(
          //         padding: EdgeInsetsDirectional.only(bottom: 10),
          //         margin: EdgeInsets.only(top: 30),
          //         child: Column(
          //           children: [
          //             CircleAvatar(
          //               backgroundImage: AssetImage('assets/images/allah.png'),
          //               radius: 60,
          //             ),
          //           ],
          //         ),
          //       ),
          //       ListTile(
          //         style: ListTileStyle.drawer,
          //         textColor: daydrawerobjects,
          //         iconColor: daydrawerobjects,
          //         minLeadingWidth: 10,
          //         title: Text(
          //           'تنظیمات',
          //           textDirection: TextDirection.rtl,
          //           style: TextStyle(fontSize: 20),
          //         ),
          //         trailing: Icon(
          //           Icons.settings,
          //         ),
          //       ),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       ListTile(
          //         textColor: daydrawerobjects,
          //         iconColor: daydrawerobjects,
          //         style: ListTileStyle.drawer,
          //         minLeadingWidth: 10,
          //         title: Text(
          //           'حمایت',
          //           textDirection: TextDirection.rtl,
          //           style: TextStyle(fontSize: 20),
          //         ),
          //         trailing: Icon(
          //           Icons.card_giftcard_sharp,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),///
          ///---------------------------------------------------
          body:Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              BtnMenu(
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const RakatShomar(),
                    ),
                  );
                },
                btnname: 'رکعت شمار',
              ),
              BtnMenu(
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const NamazShomar(),
                    ),
                  );
                },
                btnname: 'نماز شمار',
              ),
              BtnMenu(
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const ZekrShomar(),
                    ),
                  );
                },
                btnname: 'ذکر شمار',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
