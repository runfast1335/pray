// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'namaz_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NamazAdapter extends TypeAdapter<Namaz> {
  @override
  final int typeId = 1;

  @override
  Namaz read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Namaz(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as int,
      fields[4] as int,
      fields[5] as int,
      fields[6] as int,
      fields[7] as int,
      fields[8] as int,
      fields[9] as int,
      fields[10] as int,
      fields[11] as int,
      fields[12] as int,
      fields[13] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Namaz obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.sobh)
      ..writeByte(1)
      ..write(obj.zohr)
      ..writeByte(2)
      ..write(obj.asr)
      ..writeByte(3)
      ..write(obj.maqreb)
      ..writeByte(4)
      ..write(obj.esha)
      ..writeByte(5)
      ..write(obj.ghazasobh)
      ..writeByte(6)
      ..write(obj.ghazazohr)
      ..writeByte(7)
      ..write(obj.ghazaasr)
      ..writeByte(8)
      ..write(obj.ghazamaqreb)
      ..writeByte(9)
      ..write(obj.ghazaesha)
      ..writeByte(10)
      ..write(obj.shekaste)
      ..writeByte(11)
      ..write(obj.ayat)
      ..writeByte(12)
      ..write(obj.rooze)
      ..writeByte(13)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NamazAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
