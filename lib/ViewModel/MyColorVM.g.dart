// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyColorVM.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyColorVMAdapter extends TypeAdapter<MyColorVM> {
  @override
  final int typeId = 0;

  @override
  MyColorVM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyColorVM(
      itemID: fields[0] as int?,
      theme: fields[1] as int?,
      themeLight: fields[2] as int?,
      background: fields[3] as int?,
      appBarText: fields[4] as int?,
      appText: fields[5] as int?,
      fullTransparent: fields[6] as int?,
      backgroundblack_transparent: fields[7] as int?,
      error: fields[8] as int?,
      success: fields[9] as int?,
      isActive: fields[10] as bool?,
      extraColor1: fields[11] as int?,
      extraColor2: fields[12] as int?,
      extraColor3: fields[13] as int?,
      hintColor: fields[14] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MyColorVM obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.itemID)
      ..writeByte(1)
      ..write(obj.theme)
      ..writeByte(2)
      ..write(obj.themeLight)
      ..writeByte(3)
      ..write(obj.background)
      ..writeByte(4)
      ..write(obj.appBarText)
      ..writeByte(5)
      ..write(obj.appText)
      ..writeByte(6)
      ..write(obj.fullTransparent)
      ..writeByte(7)
      ..write(obj.backgroundblack_transparent)
      ..writeByte(8)
      ..write(obj.error)
      ..writeByte(9)
      ..write(obj.success)
      ..writeByte(10)
      ..write(obj.isActive)
      ..writeByte(11)
      ..write(obj.extraColor1)
      ..writeByte(12)
      ..write(obj.extraColor2)
      ..writeByte(13)
      ..write(obj.extraColor3)
      ..writeByte(14)
      ..write(obj.hintColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyColorVMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
