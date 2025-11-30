// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fan_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FanUserModelAdapter extends TypeAdapter<FanUserModel> {
  @override
  final int typeId = 2;

  @override
  FanUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FanUserModel(
      id: fields[0] as String,
      email: fields[1] as String,
      userName: fields[2] as String,
      name: fields[3] as String,
      role: fields[4] as String,
      status: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FanUserModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.role)
      ..writeByte(5)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FanUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FanUserModelImpl _$$FanUserModelImplFromJson(Map<String, dynamic> json) =>
    _$FanUserModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$FanUserModelImplToJson(_$FanUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userName': instance.userName,
      'name': instance.name,
      'role': instance.role,
      'status': instance.status,
    };
