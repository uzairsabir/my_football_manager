// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TeamDetailVM.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeamDetailVMAdapter extends TypeAdapter<TeamDetailVM> {
  @override
  final int typeId = 3;

  @override
  TeamDetailVM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeamDetailVM(
      stage: fields[0] as String,
      group: fields[1] as String?,
      position: fields[2] as String?,
      played: fields[3] as String?,
      won: fields[4] as String?,
      draw: fields[5] as String?,
      lost: fields[6] as String?,
      points: fields[7] as String?,
      goalsFor: fields[8] as String?,
      goalsAgainst: fields[9] as String?,
      goalDifference: fields[10] as String?,
      crest: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TeamDetailVM obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.stage)
      ..writeByte(1)
      ..write(obj.group)
      ..writeByte(2)
      ..write(obj.position)
      ..writeByte(3)
      ..write(obj.played)
      ..writeByte(4)
      ..write(obj.won)
      ..writeByte(5)
      ..write(obj.draw)
      ..writeByte(6)
      ..write(obj.lost)
      ..writeByte(7)
      ..write(obj.points)
      ..writeByte(8)
      ..write(obj.goalsFor)
      ..writeByte(9)
      ..write(obj.goalsAgainst)
      ..writeByte(10)
      ..write(obj.goalDifference)
      ..writeByte(11)
      ..write(obj.crest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeamDetailVMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
