// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ScreenArgumentsVM.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScreenArgumentsVMAdapter extends TypeAdapter<ScreenArgumentsVM> {
  @override
  final int typeId = 2;

  @override
  ScreenArgumentsVM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScreenArgumentsVM(
      title: fields[0] as String,
      menuID: fields[1] as double?,
      parentMenuID: fields[2] as String?,
      param_1: fields[3] as String?,
      param_2: fields[4] as String?,
      param_3: fields[5] as String?,
      param_4: fields[6] as String?,
      param_5: fields[7] as String?,
      param_6: fields[8] as String?,
      param_7: fields[9] as String?,
      param_8: fields[10] as String?,
      param_9: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ScreenArgumentsVM obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.menuID)
      ..writeByte(2)
      ..write(obj.parentMenuID)
      ..writeByte(3)
      ..write(obj.param_1)
      ..writeByte(4)
      ..write(obj.param_2)
      ..writeByte(5)
      ..write(obj.param_3)
      ..writeByte(6)
      ..write(obj.param_4)
      ..writeByte(7)
      ..write(obj.param_5)
      ..writeByte(8)
      ..write(obj.param_6)
      ..writeByte(9)
      ..write(obj.param_7)
      ..writeByte(10)
      ..write(obj.param_8)
      ..writeByte(11)
      ..write(obj.param_9);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScreenArgumentsVMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
