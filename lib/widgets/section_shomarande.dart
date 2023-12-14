import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pray/constants/colocr_constants.dart';
import 'package:pray/screens/namaz_shomar.dart';



class Sectionshomarande extends StatefulWidget {
 const Sectionshomarande({
    super.key,
    required this.name,
    required this.tedad,
    required this.onminusTap,
    required this.onplusetap,
    required this.ondangerTap,
    required this.ontickTap,
    required this.hideorshow,
   required this.witchnamazlist,
  });

  final int tedad;
  final int witchnamazlist;
  final String name;
  final bool hideorshow;
  final VoidCallback onminusTap;
  final VoidCallback onplusetap;
  final VoidCallback ondangerTap;
  final VoidCallback ontickTap;

  @override
  State<Sectionshomarande> createState() => _SectionshomarandeState();
}


class _SectionshomarandeState extends State<Sectionshomarande> {


  @override
  Widget build(BuildContext context) {

    Color colortext = dayornight == true ? daytextblack : nighttextwhite;

    return Container(
      color: Colors.blueAccent.withOpacity(0.25),
      margin: const EdgeInsetsDirectional.only(
        start: 15,
        end: 15,
        top: 20,
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 10, vertical: 7),
                width: MediaQuery.of(context).size.width - 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(splashFactory: NoSplash.splashFactory,
                        highlightColor: Colors.transparent,
                        onTap: widget.ondangerTap,
                        child: Visibility(
                          visible: widget.hideorshow,
                          child: Icon(
                            Icons.dangerous_outlined,
                            size: 40,
                            color: Colors.redAccent.withOpacity(0.8),
                          ),
                        )),
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 25,
                        color: colortext,
                      ),
                    ),
                    InkWell(splashFactory: NoSplash.splashFactory,
                        highlightColor: Colors.transparent,
                        onTap: widget.ontickTap,
                        child: Visibility(
                          visible: widget.hideorshow,
                          child: Icon(
                            Icons.task_alt,
                            size: 40,
                            color: Colors.lightGreen.withOpacity(0.8),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(splashFactory: NoSplash.splashFactory,
                        highlightColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        onTap: widget.onminusTap,
                        child: Icon(
                          Icons.remove_circle_outlined,
                          size: 50,
                          color: Colors.redAccent.withOpacity(0.8),
                        )),
                    const SizedBox(
                      width: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        adadcontroller.text = widget.tedad.toString();
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: dayblue,
                            title: const Center(child: Text('تغییر مقدار')),
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(inputFormatters: [
                                    LengthLimitingTextInputFormatter(5),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                    controller: adadcontroller,
                                    keyboardType: TextInputType.number,
                                    onSubmitted: (value) {
                                      if(adadcontroller.text.isNotEmpty){
                                        namazlist[widget.witchnamazlist] = (int.parse(adadcontroller.text)).round();
                                        save();
                                        setState(() {});
                                      }
                                      Navigator.pop(context);
                                    },

                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: const Center(
                                              child: Text(
                                            'انصراف',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if(adadcontroller.text.isNotEmpty){
                                          namazlist[widget.witchnamazlist] = (int.parse(adadcontroller.text)).round();
                                          save();
                                          setState(() {});
                                          }
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: const Center(
                                              child: Text(
                                            'تایید',
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
                          ),
                        );
                      },
                      child: Text(widget.tedad.toString(),
                          style: TextStyle(
                            fontSize: 30,
                            color: colortext,
                          )),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    InkWell(splashFactory: NoSplash.splashFactory,
                        highlightColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        onTap: widget.onplusetap,
                        child: Icon(
                          Icons.add_circle_outlined,
                          size: 50,
                          color: Colors.lightGreen.withOpacity(0.8),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
