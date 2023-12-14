import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pray/models/zekr_model.dart';
import 'package:pray/constants/colocr_constants.dart';
import 'package:pray/screens/rakat_shomar.dart';
import 'home_screen.dart';

class ZekrShomar extends StatefulWidget {
  const ZekrShomar({super.key});

  @override
  State<ZekrShomar> createState() => _ZekrShomarState();
}

int adadzekr = zekrshow();

class _ZekrShomarState extends State<ZekrShomar> {
  @override
  Widget build(BuildContext context) {
    Color backgroundcolor =
        dayornight == true ? daybackgroundwhite : nightbackgroundwhite;
    Color tabbar = dayornight == true ? dayblue : nightblue;
    Color colortext = dayornight == true ? daytextblack : nighttextwhite;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
              (route) => false,
        );
        return false;
      },
      child: SafeArea(
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
             automaticallyImplyLeading:false ,
              actions: [
                IconButton(
                  padding: const EdgeInsets.only(right: 10),
                  icon: Icon(
                      dayornight == true ? CupertinoIcons.moon : Icons.sunny,color: colortext,),
                  onPressed: () {
                    dayornight = !dayornight;
                    settingsave();
                    setState(() {});
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
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(40),
                            onTap: () {
                              adadzekr = 0;
                              zekrsave();
                              setState(() {});
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent.withOpacity(0.40),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(40)),
                                margin: const EdgeInsetsDirectional.only(
                                    bottom: 10),
                                width: MediaQuery.of(context).size.width - 75,
                                height: 100,
                                // width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'شروع مجدد',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: colortext),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Expanded( flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 24,
                    child: GestureDetector(
                      onTap: () {
                        if (adadzekr < 10000) {
                          adadzekr++;
                          zekrsave();
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height - 400,
                        width: MediaQuery.of(context).size.width - 100,
                        decoration: BoxDecoration(
                            // color: CupertinoColors.inactiveGray,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blueAccent.withOpacity(0.4),
                                  blurRadius: 100,
                                  blurStyle: BlurStyle.outer),
                            ],
                            borderRadius: BorderRadius.circular(200)),
                        child: Center(
                            child: Text(
                          adadzekr.toString(),
                          style: TextStyle(fontSize: 90, color: colortext),
                        )),
                      ),
                    ),
                  ),
                  const Expanded(flex: 3, child: SizedBox()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void zekrsave() {
  Hive.openBox('Zekr');
  Box zekrzbox1 = Hive.box('Zekr');
  final Zekr newzkr1 = Zekr(adadzekr);
  zekrzbox1.putAt(0, newzkr1);
}

int zekrshow() {
  Box zekrzbox = Hive.box('Zekr');
  final Zekr newzekr = zekrzbox.getAt(0);
  return newzekr.tedadzekr;
}
