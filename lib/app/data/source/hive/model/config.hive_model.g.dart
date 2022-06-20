// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigHiveModelAdapter extends TypeAdapter<ConfigHiveModel> {
  @override
  final int typeId = 1;

  @override
  ConfigHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfigHiveModel(
      languageSelected: fields[0] == null ? 0 : fields[0] as int,
      themeSelected: fields[1] == null ? 0 : fields[1] as int,
      fontSelected: fields[2] == null ? 0 : fields[2] as int,
      textScaleSelected: fields[3] == null ? 0 : fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ConfigHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.languageSelected)
      ..writeByte(1)
      ..write(obj.themeSelected)
      ..writeByte(2)
      ..write(obj.fontSelected)
      ..writeByte(3)
      ..write(obj.textScaleSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ConfigHiveModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
