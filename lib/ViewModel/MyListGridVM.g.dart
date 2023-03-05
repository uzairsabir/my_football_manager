// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyListGridVM.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyListGridVMAdapter extends TypeAdapter<MyListGridVM> {
  @override
  final int typeId = 1;

  @override
  MyListGridVM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyListGridVM(
      parentMenuID: fields[20] as String,
      menuID: fields[0] as double?,
      item1: fields[1] as String?,
      item2: fields[2] as String?,
      item3: fields[3] as String?,
      item4: fields[4] as String?,
      item5: fields[5] as String?,
      item6: fields[6] as String?,
      item7: fields[7] as String?,
      item8: fields[8] as String?,
      item9: fields[9] as String?,
      item10: fields[10] as String?,
      item11: fields[11] as String?,
      item12: fields[12] as String?,
      item13: fields[13] as String?,
      item14: fields[14] as String?,
      item15: fields[15] as String?,
      item16: fields[16] as String?,
      item17: fields[17] as String?,
      item18: fields[18] as String?,
      item19: fields[19] as String?,
      action: fields[21] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MyListGridVM obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.menuID)
      ..writeByte(1)
      ..write(obj.item1)
      ..writeByte(2)
      ..write(obj.item2)
      ..writeByte(3)
      ..write(obj.item3)
      ..writeByte(4)
      ..write(obj.item4)
      ..writeByte(5)
      ..write(obj.item5)
      ..writeByte(6)
      ..write(obj.item6)
      ..writeByte(7)
      ..write(obj.item7)
      ..writeByte(8)
      ..write(obj.item8)
      ..writeByte(9)
      ..write(obj.item9)
      ..writeByte(10)
      ..write(obj.item10)
      ..writeByte(11)
      ..write(obj.item11)
      ..writeByte(12)
      ..write(obj.item12)
      ..writeByte(13)
      ..write(obj.item13)
      ..writeByte(14)
      ..write(obj.item14)
      ..writeByte(15)
      ..write(obj.item15)
      ..writeByte(16)
      ..write(obj.item16)
      ..writeByte(17)
      ..write(obj.item17)
      ..writeByte(18)
      ..write(obj.item18)
      ..writeByte(19)
      ..write(obj.item19)
      ..writeByte(20)
      ..write(obj.parentMenuID)
      ..writeByte(21)
      ..write(obj.action);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyListGridVMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
