import 'package:hive/hive.dart';

part 'savesetting_model.g.dart';

@HiveType(typeId: 3)
class Setting extends HiveObject{

  @HiveField(0)
  bool touchorseosor;
  @HiveField(1)
  bool musiconoroff;
  @HiveField(2)
  bool dayornight;

  Setting(this.touchorseosor, this.musiconoroff, this.dayornight);
}