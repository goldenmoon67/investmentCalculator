// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'percent_result_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PercentResultAdapter extends TypeAdapter<PercentResult> {
  @override
  final int typeId = 3;

  @override
  PercentResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PercentResult(
      crypto: fields[0] as Crypto,
      currentRange: fields[1] as double,
      percentWeWant: fields[2] as double,
      lastPrice: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, PercentResult obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.crypto)
      ..writeByte(1)
      ..write(obj.currentRange)
      ..writeByte(2)
      ..write(obj.percentWeWant)
      ..writeByte(3)
      ..write(obj.lastPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PercentResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
