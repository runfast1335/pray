import 'package:flutter/material.dart';
import 'package:pray/constants/colocr_constants.dart';



class BtnMenu extends StatelessWidget {
  const BtnMenu({super.key, required this.btnname, required this.ontap,});

  final String btnname;
  final  VoidCallback ontap ;

  @override
  Widget build(BuildContext context) {
    Color colortext= dayornight==true? daytextblack:nighttextwhite ;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.40),
            borderRadius: BorderRadiusDirectional.circular(40)),
          margin: const EdgeInsetsDirectional.only(bottom: 50),
          width: MediaQuery.of(context).size.width - 75,
          height: 100,
          child: InkWell(onTap: ontap, borderRadius:  BorderRadius.circular(40),

             // width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
               // mainAxisSize: MainAxisSize.max,
                children: [
                  Text(btnname,style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: colortext),),
                ],
              )),
        ),
      ],
    );
  }
}
