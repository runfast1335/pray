import 'package:hive/hive.dart';

part 'zekr_model.g.dart';

@HiveType(typeId: 2)
class Zekr extends HiveObject{

  @HiveField(0)
  int tedadzekr;

  Zekr(this.tedadzekr);
}