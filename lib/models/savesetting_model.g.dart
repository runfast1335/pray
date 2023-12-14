// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savesetting_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingAdapter extends TypeAdapter<Setting> {
  @override
  final int typeId = 3;

  @override
  Setting read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Setting(
      fields[0] as bool,
      fields[1] as bool,
      fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Setting obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.touchorseosor)
      ..writeByte(1)
      ..write(obj.musiconoroff)
      ..writeByte(2)
      ..write(obj.dayornight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
