import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pray/models/savesetting_model.dart';
import 'package:pray/screens/home_screen.dart';
import 'package:pray/screens/namaz_shomar.dart';
import 'package:pray/constants/colocr_constants.dart';
import 'package:pray/widgets/btn_witchnamaz.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'dart:async';
import 'package:proximity_sensor/proximity_sensor.dart';
import 'package:wakelock_plus/wakelock_plus.dart';




class RakatShomar extends StatefulWidget {
 const  RakatShomar({super.key});

  @override
  State<RakatShomar> createState() => _RakatShomarState();
}

int numberofrakat = 0;
int whatnamaz = 0;
int witchnamaz = 0;
bool adaorqaza = true;
bool saveornot = true;
bool touchorseosor = settingshow().touchorseosor;
bool musiconoroff = settingshow().musiconoroff;


class _RakatShomarState extends State<RakatShomar>with WidgetsBindingObserver {
  // This variable will tell you whether the application is in foreground or not.
  bool _isInForeground = true;

  late StreamSubscription<dynamic> _streamSubscription;

  List<String> rakatlist = [
    '',
    ' اول ',
    ' اول ',
    ' دوم ',
    ' دوم ',
    ' ســوم ',
    ' ســوم ',
    ' چهارم ',
    ' چهارم ',
    ' '
  ];
  List<String> sajdelist = [
    '  بسم الله الرحمن الرحیم  ',
    ' اول ',
    ' دوم ',
    ' اول ',
    ' دوم ',
    ' اول ',
    ' دوم ',
    ' اول ',
    ' دوم ',
    ' التماس دعا '
  ];
  ///---------------------for proximity_sensor-------------------------

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WakelockPlus.enable();
    listenSensor();
    Hive.openBox('Zekr');
    Hive.openBox('Namaz');
    Hive.openBox('Setting');
    //Box namazbox = Hive.box('Namaz');
    //final Namaz newnamaz = namazbox.getAt(0);
    // print(
    //     ' صبح= ${newnamaz.sobh}'
    //     ' ظهر= ${newnamaz.zohr}'
    //     ' عصر= ${newnamaz.asr}'
    //     ' مغرب= ${newnamaz.maqreb}'
    //     ' اعشا= ${newnamaz.esha}'
    //     ' ایدی= ${newnamaz.id}'
    // );
    // print(namazlist);

  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    _isInForeground = state == AppLifecycleState.resumed;
    print(_isInForeground);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    WakelockPlus.disable();
    _streamSubscription.cancel();
    super.dispose();
  }




  Future<void> listenSensor() async {
    FlutterError.onError = (FlutterErrorDetails details) {
      if (foundation.kDebugMode) {
        FlutterError.dumpErrorToConsole(details);
      }
    };

    _streamSubscription = ProximitySensor.events.listen((int event ) {
     if (event > 0) {
       if (touchorseosor==false && _isInForeground == true ) {
          nextrakat();
       }
     }
      setState(() {});
    },
     );
  }

///-------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    Color colortext= dayornight==true? daytextblack:nighttextgray ;
    Color backgroundcolor = dayornight==true?daybackgroundwhite:nightbackgroundwhite;
    //Color tabbar = dayornight == true ? dayblue : nightblue;
    return WillPopScope(
      onWillPop: () async {
        numberofrakat = 0;
        whatnamaz = 0;
        witchnamaz = 0;
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
            ///----------------appbar is hear---------------------
            // appBar: AppBar(
            //   automaticallyImplyLeading: false,
            //   backgroundColor: tabbar,
            // ),
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
            // ),
            ///---------------------------------------------------
            body: Column(
              children: [
                const SizedBox(height: 30,),
                Expanded(
                  flex: 57,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashFactory: NoSplash.splashFactory,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          
                          if (touchorseosor==true) {
                            nextrakat();
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * (95 / 100),
                          margin: const EdgeInsetsDirectional.only(top: 10),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text(
                                  'اللَّهُمَّ أَغْنِنِي بِحَلَالِكَ عَنْ حَرَامِكَ َ',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontFamily: 'IranNastaliq',
                                    fontSize: 20,
                                    color: colortext,
                                  ),
                                ),

                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    rakatlist[numberofrakat].toString(),
                                    style:  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: numberofrakat==0?45:60,
                                      fontFamily: 'IranNastaliq',
                                      color: colortext,
                                    ),
                                  ),
                                  Visibility(
                                    visible: numberofrakat==0||numberofrakat==9?false:true,
                                    child: Text('   :  رکعت ',style:  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'IranNastaliq',
                                      color: colortext,
                                    ),),
                                  )
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    sajdelist[numberofrakat].toString(),
                                    style:  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: numberofrakat==0?45:60,
                                      fontFamily: 'IranNastaliq',
                                      color: colortext,
                                    ),
                                  ),
                                  Visibility(
                                    visible: numberofrakat==0||numberofrakat==9?false:true,
                                    child: Text('   :  ســـجده ',style:  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'IranNastaliq',
                                      color: colortext,
                                    ),),
                                  )
                                ]),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: const EdgeInsets.only(right: 10),
                          icon: Icon(
                              dayornight == true ?  CupertinoIcons.moon :Icons.sunny ,
                                  color: colortext,
                          ),
                          onPressed: () {
                            dayornight=!dayornight;
                            settingsave();
                            setState(() { });

                          },
                        ),
                        Text(chenamazshomari(),
                          style:  TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold,color: colortext,),),
                        Theme(
                          data: Theme.of(context).copyWith(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                          ),
                          child: PopupMenuButton(

                            color: backgroundcolor.withOpacity(0.99),
                            icon:  Icon(Icons.menu,color:colortext,size: 30,),
                            constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(25)),
                            itemBuilder: (context) => [

                              PopupMenuItem(

                                onTap: () {
                                  saveornot=!saveornot;
                                  setState(() {});
                                },
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Text(saveornot == true
                                        ? 'ذخیره نشود'
                                        : 'ذخیره شود',style: TextStyle(color: colortext,),),
                                  ],
                                ),

                              ),

                              PopupMenuItem(
                                onTap: () {
                                  adaorqaza=!adaorqaza;
                                  setState(() {});
                                },
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Text(adaorqaza == true
                                        ? 'نماز قضا '
                                        : 'نماز یومیه',style: TextStyle(color: colortext,)),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                onTap: () {
                                  touchorseosor=!touchorseosor;
                                  settingsave();
                                  setState(() {});
                                },
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Text(touchorseosor == true
                                        ? 'سنسور'
                                        : 'لمسی',style: TextStyle(color: colortext,)),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                onTap: () {
                                  musiconoroff=!musiconoroff;
                                  settingsave();
                                  setState(() {});
                                },
                                child:  Row(
                                  children: [
                                    Icon(musiconoroff==true?Icons.music_off:Icons.music_note,color: colortext,),
                                    const Spacer(),
                                     Text('صدا ',style: TextStyle(color: colortext),),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 90,
                        child: Row(
                          children: [
                            BtnWitchNamaz(
                              witchnamaznumbr: 5,
                              witchnamaz: witchnamaz,
                              ontap: () {
                                numberofrakat = 0;
                                whatnamaz = 4;
                                witchnamaz = 5;
                                setState(() {});
                              },
                              btnname: 'عشاء',
                            ),
                            BtnWitchNamaz(
                              witchnamaznumbr: 4,
                              witchnamaz: witchnamaz,
                              ontap: () {
                                numberofrakat = 0;
                                whatnamaz = 3;
                                witchnamaz = 4;
                                setState(() {});
                              },
                              btnname: 'مغرب',
                            ),
                            BtnWitchNamaz(
                                witchnamaznumbr: 3,
                                witchnamaz: witchnamaz,
                                ontap: () {
                                  numberofrakat = 0;
                                  whatnamaz = 4;
                                  witchnamaz = 3;
                                  setState(() {});
                                },
                                btnname: 'عصر'),
                            BtnWitchNamaz(
                                witchnamaznumbr: 2,
                                witchnamaz: witchnamaz,
                                ontap: () {
                                  numberofrakat = 0;
                                  whatnamaz = 4;
                                  witchnamaz = 2;
                                  setState(() {});
                                },
                                btnname: 'ظهر'),
                            BtnWitchNamaz(
                                witchnamaznumbr: 1,
                                witchnamaz: witchnamaz,
                                ontap: () {
                                  numberofrakat = 0;
                                  whatnamaz = 2;
                                  witchnamaz = 1;
                                  setState(() {});
                                },
                                btnname: 'صبح'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 3, child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }



  void nextrakat() {
    if (whatnamaz == 2 && numberofrakat < 5) {
       numberofrakat++;
       if (musiconoroff==true && numberofrakat < 4) {
         AudioPlayer().play(AssetSource('audio/click.mp3'));
       }
       if (musiconoroff==true && numberofrakat == 4) {
         AudioPlayer().play(AssetSource('audio/last.mp3'));
       }
      if (whatnamaz == 2 && numberofrakat == 4) {
        saveonnamazshomar();
      }
      else if (whatnamaz == 2 && numberofrakat > 4) {
        numberofrakat = 9;
        setState(() {});
       // witchnamaz=0;
      }
      setState(() {});
    } else if (whatnamaz == 3 && numberofrakat < 7) {
      numberofrakat++;
      if (musiconoroff==true&& numberofrakat < 6) {
      AudioPlayer().play(AssetSource('audio/click.mp3'));
      }
      if (musiconoroff==true && numberofrakat == 6) {
        AudioPlayer().play(AssetSource('audio/last.mp3'));
      }
      if (whatnamaz == 3 && numberofrakat == 6) {
        saveonnamazshomar();
      }
      else if (whatnamaz == 3 && numberofrakat > 6) {
        numberofrakat = 9;
        setState(() {});
       // witchnamaz=0;
      }
      setState(() {});
    } else if (whatnamaz == 4 && numberofrakat < 9) {
      numberofrakat++;
      if (musiconoroff==true&& numberofrakat < 8) {
        AudioPlayer().play(AssetSource('audio/click.mp3'));
      }
      if (musiconoroff==true && numberofrakat == 8) {
        AudioPlayer().play(AssetSource('audio/last.mp3'));
      }
      if (whatnamaz == 4 && numberofrakat == 8) {
        saveonnamazshomar();
      }
      if (whatnamaz == 4 && numberofrakat == 9) {
       // witchnamaz=0;
      }
      setState(() {});
    } else if (whatnamaz == 0) {
      showAlertDialog(context);
    }
  }

  saveonnamazshomar() {
    if (saveornot == true) {
      if (adaorqaza == true) {
        if (witchnamaz == 1) {
          namazlist[0]++;
        }
        if (witchnamaz == 2) {
          namazlist[1]++;
        }
        if (witchnamaz == 3) {
          namazlist[2]++;
        }
        if (witchnamaz == 4) {
          namazlist[3]++;
        }
        if (witchnamaz == 5) {
          namazlist[4]++;
        }
      } else if (adaorqaza == false) {
        if (witchnamaz == 1) {
          namazlist[5]++;
        }
        if (witchnamaz == 2) {
          namazlist[6]++;
        }
        if (witchnamaz == 3) {
          namazlist[7]++;
        }
        if (witchnamaz == 4) {
          namazlist[8]++;
        }
        if (witchnamaz == 5) {
          namazlist[9]++;
        }
      }
      save();
    }
  }

  String chenamazshomari() {
    if (saveornot == true) {
      if (adaorqaza == true) {
        return 'در حال ذخیره شدن نماز یومیه';
      } else {
        return 'در حال ذخیره شدن نماز قضا';
      }
    } else {
      return 'نماز ها ذخیره نمی شوند';
    } //else
  }

   //tonamazshomar
}

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: const Text('ابتدا نماز مورد نظر را انتخاب کنید'),
        actions: [
          TextButton(
            child: const Text('باشه'),
            onPressed: () {
              Navigator.of(context).pop(); // برای بستن دیالوگ
            },
          ),
        ],
      );
    },
  );
}

void settingsave() {
  Hive.openBox('Setting');
  Box settingbox1 = Hive.box('Setting');
  final Setting newSetting = Setting(touchorseosor, musiconoroff, dayornight);
  settingbox1.putAt(0, newSetting);
}

Setting settingshow() {
  Hive.openBox('Setting');
  Box settingzbox = Hive.box('Setting');
  final Setting newsetting = settingzbox.getAt(0);
  return newsetting;
}