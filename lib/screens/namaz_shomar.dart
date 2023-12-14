import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pray/screens/home_screen.dart';
import 'package:pray/screens/rakat_shomar.dart';
import '../constants/colocr_constants.dart';
import '../models/namaz_model.dart';
import '../widgets/section_shomarande.dart';

class NamazShomar extends StatefulWidget {
  const NamazShomar({super.key});

  @override
  State<NamazShomar> createState() => _NamazShomarState();
}

final TextEditingController adadcontroller = TextEditingController();



int sobh = show(0);
int zohr = show(1);
int asr = show(2);
int maqreb = show(3);
int esha = show(4);
int ghazasobh = show(5);
int ghazazohr = show(6);
int ghazaasr = show(7);
int ghazamaqreb = show(8);
int ghazaesha = show(9);
int shekaste = show(10);
int ayat = show(11);
int rooze = show(12);

List<int> namazlist = [
  sobh,
  zohr,
  asr,
  maqreb,
  esha,
  ghazasobh,
  ghazazohr,
  ghazaasr,
  ghazamaqreb,
  ghazaesha,
  shekaste,
  ayat,
  rooze
];


int adadtaghirsobh = 0;
int adadtaghirzohr = 0;
int adadtaghirasr = 0;
int adadtaghirmaqreb = 0;
int adadtaghiresha = 0;
int adadtaghirghazasobh = 0;
int adadtaghirghazazohr = 0;
int adadtaghirghazaasr = 0;
int adadtaghirghazamaqreb = 0;
int adadtaghirghazaesha = 0;
int adadtaghirshekaste = 0;
int adadtaghirayat = 0;
int adadtaghirrooze = 0;

List<int> adadtaghirlist = [
  adadtaghirsobh,
  adadtaghirzohr,
  adadtaghirasr,
  adadtaghirmaqreb,
  adadtaghiresha,
  adadtaghirghazasobh,
  adadtaghirghazazohr,
  adadtaghirghazaasr,
  adadtaghirghazamaqreb,
  adadtaghirghazaesha,
  adadtaghirshekaste,
  adadtaghirayat,
  adadtaghirrooze
];

bool hideshowset0 = false;
bool hideshowset1 = false;
bool hideshowset2 = false;
bool hideshowset3 = false;
bool hideshowset4 = false;
bool hideshowset5 = false;
bool hideshowset6 = false;
bool hideshowset7 = false;
bool hideshowset8 = false;
bool hideshowset9 = false;
bool hideshowset10 = false;
bool hideshowset11 = false;
bool hideshowset12 = false;

List<bool> hideorshowset = [
  hideshowset0,
  hideshowset1,
  hideshowset2,
  hideshowset3,
  hideshowset4,
  hideshowset5,
  hideshowset6,
  hideshowset7,
  hideshowset8,
  hideshowset9,
  hideshowset10,
  hideshowset11,
  hideshowset12
];


class _NamazShomarState extends State<NamazShomar> {



  @override
  Widget build(BuildContext context) {
    Color tabbar = dayornight == true ? dayblue : nightblue;
    Color backgroundcolor =
        dayornight == true ? daybackgroundwhite : nightbackgroundwhite;
    Color colortext= dayornight==true? Colors.white:nighttextwhite ;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),

          (route) => false,
        );
        for(int i =0; i <13;i++){
          ontickordangtaped(false, i);
        };
        return false;
      },
      child: DefaultTabController(
        length: 3,
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
                automaticallyImplyLeading: false,
                backgroundColor: tabbar,
                actions: [
                  IconButton(
                    padding: const EdgeInsets.only(right: 10),
                    icon: Icon(
                        dayornight == true ? CupertinoIcons.moon : Icons.sunny,color: dayornight==true? daytextblack:nighttextwhite ),
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
              body: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [
                    Container(
                      color: tabbar,
                      child:  TabBar(
                        labelStyle:  TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold,color: colortext,),
                        indicatorColor: colortext,
                        indicatorPadding: const EdgeInsetsDirectional.only(bottom: 1),
                        tabs: const [
                          Tab(text: 'نماز یومیه'),
                          Tab(text: 'نماز قضا'),
                          Tab(text: 'سایر'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: TabBarView(
                          children: [
                            Container(
                              margin: const EdgeInsetsDirectional.only(
                                start: 15,
                                end: 15,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Sectionshomarande(
                                        witchnamazlist: 0,
                                        name: 'نماز صبح',
                                        tedad: namazlist[0],
                                        hideorshow: hideorshowset[0],
                                        ondangerTap: () {
                                          ontickordangtaped(false, 0);
                                        },
                                        ontickTap: () {
                                          ontickordangtaped(true, 0);
                                        },
                                        onminusTap: () {
                                          ontap(0, false);
                                        },
                                        onplusetap: () {
                                          ontap(0, true);
                                        }),
                                    Sectionshomarande(
                                        witchnamazlist: 1,
                                        name: 'نماز ظهر',
                                        tedad: namazlist[1],
                                        hideorshow: hideorshowset[1],
                                        ondangerTap: () {
                                          ontickordangtaped(false, 1);
                                        },
                                        ontickTap: () {
                                          ontickordangtaped(true, 1);
                                        },
                                        onminusTap: () {
                                          ontap(1, false);
                                        },
                                        onplusetap: () {
                                          ontap(1, true);
                                        }),
                                    Sectionshomarande(
                                        witchnamazlist: 2,
                                        name: 'نماز عصر',
                                        tedad: namazlist[2],
                                        hideorshow: hideorshowset[2],
                                        ondangerTap: () {
                                          ontickordangtaped(false, 2);
                                        },
                                        ontickTap: () {
                                          ontickordangtaped(true, 2);
                                        },
                                        onminusTap: () {
                                          ontap(2, false);
                                        },
                                        onplusetap: () {
                                          ontap(2, true);
                                        }),
                                    Sectionshomarande(
                                        witchnamazlist: 3,
                                        name: 'نماز مغرب',
                                        tedad: namazlist[3],
                                        hideorshow: hideorshowset[3],
                                        ondangerTap: () {
                                          ontickordangtaped(false, 3);
                                        },
                                        ontickTap: () {
                                          ontickordangtaped(true, 3);
                                        },
                                        onminusTap: () {
                                          ontap(3, false);
                                        },
                                        onplusetap: () {
                                          ontap(3, true);
                                        }),
                                    Sectionshomarande(
                                        witchnamazlist: 4,
                                        name: 'نماز عشاء',
                                        tedad: namazlist[4],
                                        hideorshow: hideorshowset[4],
                                        ondangerTap: () {
                                          ontickordangtaped(false, 4);
                                        },
                                        ontickTap: () {
                                          ontickordangtaped(true, 4);
                                        },
                                        onminusTap: () {
                                          ontap(4, false);
                                        },
                                        onplusetap: () {
                                          ontap(4, true);
                                        }),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsetsDirectional.only(
                                start: 15,
                                end: 15,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Sectionshomarande(
                                        witchnamazlist: 5,
                                        name: 'نماز صبح',
                                        tedad: namazlist[5],
                                        hideorshow: hideorshowset[5],
                                        ondangerTap: () {
                                          ontickordangtaped(false, 5);
                                        },
                                        ontickTap: () {
                                          ontickordangtaped(true, 5);
                                        },
                                        onminusTap: () {
                                          ontap(5, false);
                                        },
                                        onplusetap: () {
                                          ontap(5, true);
                                        }),
                                    Sectionshomarande(
                                        witchnamazlist: 6,
                                        name: 'نماز ظهر',
                                        tedad: namazlist[6],
                                        hideorshow: hideorshowset[6],
                                        ondangerTap: () {
                                          ontickordangtaped(false, 6);
                                        },
                                        ontickTap: () {
                                          ontickordangtaped(true, 6);
                                        },
                                        onminusTap: () {
                                          ontap(6, false);
                                        },
                                        onplusetap: () {
                                          ontap(6, true);
                                        }),
                                    Sectionshomarande(
                                        witchnamazlist: 7,
                                        name: 'نماز عصر',
                                        tedad: namazlist[7],
                                        hideorshow: hideorshowset[7],
                                        ondangerTap: () {
                                          ontickordangtaped(false, 7);
                                        },
                                        ontickTap: () {
                                          ontickordangtaped(true, 7);
                                        },
                                        onminusTap: () {
                                          ontap(7, false);
                                        },
                                        onplusetap: () {
                                          ontap(7, true);
                                        }),
                                    Sectionshomarande(
                                        witchnamazlist: 8,
                                        name: 'نماز مغرب',
                                        tedad: namazlist[8],
                                        hideorshow: hideorshowset[8],
                                        ondangerTap: () {
                                          ontickordangtaped(false, 8);
                                        },
                                        ontickTap: () {
                                          ontickordangtaped(true, 8);
                                        },
                                        onminusTap: () {
                                          ontap(8, false);
                                        },
                                        onplusetap: () {
                                          ontap(8, true);
                                        }),
                                    Sectionshomarande(
                                        witchnamazlist: 9,
                                        name: 'نماز عشاء',
                                        tedad: namazlist[9],
                                        hideorshow: hideorshowset[9],
                                        ondangerTap: () {
                                          ontickordangtaped(false, 9);
                                        },
                                        ontickTap: () {
                                          ontickordangtaped(true, 9);
                                        },
                                        onminusTap: () {
                                          ontap(9, false);
                                        },
                                        onplusetap: () {
                                          ontap(9, true);
                                        }),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsetsDirectional.only(
                                start: 15,
                                end: 15,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Sectionshomarande(
                                        witchnamazlist: 10,
                                        name: 'نماز شکسته',
                                        tedad: namazlist[10],
                                        hideorshow: hideorshowset[10],
                                        ondangerTap: () {
                                          ontickordangtaped(false, 10);
                                        },
                                        ontickTap: () {
                                          ontickordangtaped(true, 10);
                                        },
                                        onminusTap: () {
                                          ontap(10, false);
                                        },
                                        onplusetap: () {
                                          ontap(10, true);
                                        }),
                                    Sectionshomarande(
                                        witchnamazlist: 11,
                                        name: 'نماز آیات',
                                        tedad: namazlist[11],
                                        hideorshow: hideorshowset[11],
                                        ondangerTap: () {
                                          ontickordangtaped(false, 11);
                                        },
                                        ontickTap: () {
                                          ontickordangtaped(true, 11);
                                        },
                                        onminusTap: () {
                                          ontap(11, false);
                                        },
                                        onplusetap: () {
                                          ontap(11, true);
                                        }),
                                    Sectionshomarande(
                                        witchnamazlist: 12,
                                        name: 'روزه',
                                        tedad: namazlist[12],
                                        hideorshow: hideorshowset[12],
                                        ondangerTap: () {
                                          ontickordangtaped(false, 12);
                                        },
                                        ontickTap: () {
                                          ontickordangtaped(true, 12);
                                        },
                                        onminusTap: () {
                                          ontap(12, false);
                                        },
                                        onplusetap: () {
                                          ontap(12, true);
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ontickordangtaped(bool what, int number) {
    if (what == true) {
      save();
      adadtaghirlist[number] = 0;
    } else if (what == false) {
      if (adadtaghirlist[number] == 0) {
        adadtaghirlist[number] = 0;
      } //
      else if (adadtaghirlist[number] > 0) {
        for (int i = adadtaghirlist[number]; i > 0; i--) {
          namazlist[number]--;
        }
        adadtaghirlist[number] = 0;
      } //
      else if (adadtaghirlist[number] < 0) {
        for (int i = adadtaghirlist[number]; i < 0; i++) {
          namazlist[number]++;
        }
        adadtaghirlist[number] = 0;
      }
    }
    hideorshowset[number] = false;
    setState(() {});
  } //ontickordangtaped

  ontap(int number, bool tap) {
    if (tap == true) {
      adadtaghirlist[number]++;
      namazlist[number]++;
      if(namazlist[number]>0){
        hideorshowset[number] = true;
      }
    } //
    else if(tap == false) {
      if (namazlist[number] > 0) {
        if(namazlist[number]>0){
          hideorshowset[number] = true;
        }
        namazlist[number]--;
        adadtaghirlist[number]--;
      }
    }

    setState(() {});
  }
}

save() {
  Box namazbox = Hive.box('Namaz');
  Namaz nnamaz = Namaz(
      namazlist[0],
      namazlist[1],
      namazlist[2],
      namazlist[3],
      namazlist[4],
      namazlist[5],
      namazlist[6],
      namazlist[7],
      namazlist[8],
      namazlist[9],
      namazlist[10],
      namazlist[11],
      namazlist[12],
      0);
  namazbox.putAt(0, nnamaz);
}

int show(int number) {
  Box namazbox = Hive.box('Namaz');
  final Namaz newnamaz = namazbox.getAt(0);
  if (number == 0) {
    return newnamaz.sobh;
  } else if (number == 1) {
    return newnamaz.zohr;
  } else if (number == 2) {
    return newnamaz.asr;
  } else if (number == 3) {
    return newnamaz.maqreb;
  } else if (number == 4) {
    return newnamaz.esha;
  } else if (number == 5) {
    return newnamaz.ghazasobh;
  } else if (number == 6) {
    return newnamaz.ghazazohr;
  } else if (number == 7) {
    return newnamaz.ghazaasr;
  } else if (number == 8) {
    return newnamaz.ghazamaqreb;
  } else if (number == 9) {
    return newnamaz.ghazaesha;
  } else if (number == 10) {
    return newnamaz.shekaste;
  } else if (number == 11) {
    return newnamaz.ayat;
  } else if (number == 12) {
    return newnamaz.rooze;
  } else {
    return 100;
  }
}

cengtedaddialog() {
  AlertDialog(
    title: const Text('تغییر مقدار'),
    content: Column(mainAxisSize: MainAxisSize.min, children: [
      TextField(
        controller: adadcontroller,
      ),
      Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Center(
                  child: Text(
                'data',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
            ),
          ),
          InkWell(
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Center(
                  child: Text(
                'data',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
            ),
          ),
        ],
      )
    ]),
  );
}
