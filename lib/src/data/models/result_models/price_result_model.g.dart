// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_result_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceResultAdapter extends TypeAdapter<PriceResult> {
  @override
  final int typeId = 4;

  @override
  PriceResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PriceResult(
      crypto: fields[0] as Crypto,
      expectingProfit: fields[4] as double,
      currentRange: fields[1] as double,
      howMuch: fields[2] as double,
      lastPrice: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, PriceResult obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.crypto)
      ..writeByte(1)
      ..write(obj.currentRange)
      ..writeByte(2)
      ..write(obj.howMuch)
      ..writeByte(3)
      ..write(obj.lastPrice)
      ..writeByte(4)
      ..write(obj.expectingProfit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
