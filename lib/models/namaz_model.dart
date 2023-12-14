import 'package:hive/hive.dart';

part 'namaz_model.g.dart';

@HiveType(typeId: 1)
class Namaz extends HiveObject{
  @HiveField(0)
  int sobh;
  @HiveField(1)
  int zohr ;
  @HiveField(2)
  int asr ;
  @HiveField(3)
  int maqreb;
  @HiveField(4)
  int esha ;
  @HiveField(5)
  int ghazasobh ;
  @HiveField(6)
  int ghazazohr ;
  @HiveField(7)
  int ghazaasr ;
  @HiveField(8)
  int ghazamaqreb ;
  @HiveField(9)
  int ghazaesha ;
  @HiveField(10)
  int shekaste ;
  @HiveField(11)
  int ayat ;
  @HiveField(12)
  int rooze ;
  @HiveField(13)
  int id;

  Namaz(
      this.sobh,
      this.zohr,
      this.asr,
      this.maqreb,
      this.esha,
      this.ghazasobh,
      this.ghazazohr,
      this.ghazaasr,
      this.ghazamaqreb,
      this.ghazaesha,
      this.shekaste,
      this.ayat,
      this.rooze,
      this.id
      );
}

