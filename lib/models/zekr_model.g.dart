// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zekr_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ZekrAdapter extends TypeAdapter<Zekr> {
  @override
  final int typeId = 2;

  @override
  Zekr read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Zekr(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Zekr obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.tedadzekr);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ZekrAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
