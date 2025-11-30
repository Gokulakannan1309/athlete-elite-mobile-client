// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athlete_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AthleteUserAdapter extends TypeAdapter<AthleteUser> {
  @override
  final int typeId = 1;

  @override
  AthleteUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AthleteUser(
      id: fields[0] as String,
      email: fields[1] as String,
      name: fields[2] as String,
      role: fields[3] as String,
      status: fields[4] as String,
      firstTimeLogin: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AthleteUser obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.role)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.firstTimeLogin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AthleteUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AthleteUserImpl _$$AthleteUserImplFromJson(Map<String, dynamic> json) =>
    _$AthleteUserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      status: json['status'] as String,
      firstTimeLogin: json['firstTimeLogin'] as bool? ?? false,
    );

Map<String, dynamic> _$$AthleteUserImplToJson(_$AthleteUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'status': instance.status,
      'firstTimeLogin': instance.firstTimeLogin,
    };
