// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'power_poles.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PowerPolesAdapter extends TypeAdapter<PowerPoles> {
  @override
  final int typeId = 1;

  @override
  PowerPoles read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PowerPoles(
      elevation: fields[0] as String?,
      property: fields[1] as String?,
      latitude: fields[2] as double?,
      longitude: fields[3] as double?,
      uuid: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PowerPoles obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.elevation)
      ..writeByte(1)
      ..write(obj.property)
      ..writeByte(2)
      ..write(obj.latitude)
      ..writeByte(3)
      ..write(obj.longitude)
      ..writeByte(4)
      ..write(obj.uuid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PowerPolesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
