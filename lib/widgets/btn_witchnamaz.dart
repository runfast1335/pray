import 'package:flutter/material.dart';
import '../constants/colocr_constants.dart';



class BtnWitchNamaz extends StatelessWidget {
  const BtnWitchNamaz(
      {super.key,
      required this.witchnamaznumbr,
      required this.witchnamaz,
      required this.ontap,
      required this.btnname});

  final int witchnamaznumbr;
  final int witchnamaz;
  final String btnname;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    Color colorbtnselected =
        dayornight == true ? daybtnnamazselected : nightbtnnamazselected;
    Color colorbtnunselected =
        dayornight == true ? daybtnnamazunselected : nightbtnnamazunselected;
    Color colortextselected= dayornight==true? daytextwhite:daytextblack ;
    Color colortextunselected= dayornight==true? daytextblack:nighttextgray ;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: witchnamaz == witchnamaznumbr
                ? colorbtnselected
                : colorbtnunselected,
            borderRadius: BorderRadius.circular(25)),
        margin: const EdgeInsetsDirectional.only(
            top: 10, bottom: 10, end: 3, start: 3),
        child: Container(
          decoration: BoxDecoration(
            // color: CupertinoColors.inactiveGray,
              boxShadow: [
                BoxShadow(
                    color: witchnamaz == witchnamaznumbr
                        ? colorbtnunselected
                        : colorbtnselected,
                    blurRadius: 5,
                    blurStyle: BlurStyle.outer),
              ],
              borderRadius: BorderRadius.circular(200)),
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            onTap: ontap,
            child: Center(
                child: Text(
              btnname,
              style: TextStyle(
                  color: witchnamaz == witchnamaznumbr
                      ? (colortextselected)
                      : (colortextunselected),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
