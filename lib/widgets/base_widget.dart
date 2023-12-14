import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pray/constants/colocr_constants.dart';



class BaseWidget extends StatefulWidget {
  const BaseWidget({
    super.key,
    required this.widget,

  });

  final Widget widget;

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    Color backgroundcolor =
        dayornight == true ? daybackgroundwhite : nightbackgroundwhite;
    Color tabbar = dayornight == true ? dayblue : nightblue;

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
                    dayornight == true ? Icons.sunny : CupertinoIcons.moon),
                onPressed: () {
                  dayornight=!dayornight;
                  setState(() { });

                },
              ),
            ],
          ),
          drawer: Drawer(
            backgroundColor: tabbar,
            shape: const Border(
              right: BorderSide(style: BorderStyle.solid),
            ),
            child: const Column(
              children: [
                DrawerHeader(
                  padding: EdgeInsetsDirectional.only(bottom: 10),
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/allah.png'),
                        radius: 60,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  style: ListTileStyle.drawer,
                  textColor: daydrawerobjects,
                  iconColor: daydrawerobjects,
                  minLeadingWidth: 10,
                  title: Text(
                    'تنظیمات',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.settings,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  textColor: daydrawerobjects,
                  iconColor: daydrawerobjects,
                  style: ListTileStyle.drawer,
                  minLeadingWidth: 10,
                  title: Text(
                    'حمایت',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.card_giftcard_sharp,
                  ),
                ),
              ],
            ),
          ),
          body: widget.widget,
        ),
      ),
    );
  }
}



