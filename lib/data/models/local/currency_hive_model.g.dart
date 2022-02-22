// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyHiveModelAdapter extends TypeAdapter<CurrencyHiveModel> {
  @override
  final int typeId = 0;

  @override
  CurrencyHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyHiveModel(
      id: fields[0] as int,
      name: fields[1] as String,
      fullName: fields[2] as String,
      symbol: fields[3] as String,
      rateToUah: fields[4] as double,
      countryCode: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.symbol)
      ..writeByte(4)
      ..write(obj.rateToUah)
      ..writeByte(5)
      ..write(obj.countryCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
