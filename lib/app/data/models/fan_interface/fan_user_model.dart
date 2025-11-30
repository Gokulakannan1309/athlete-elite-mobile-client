import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'fan_user_model.freezed.dart';
part 'fan_user_model.g.dart';

@freezed
@HiveType(typeId: 1)
class FanUserModel with _$FanUserModel {
  const factory FanUserModel({
    @HiveField(0) required String id,
    @HiveField(1) required String email,
    @HiveField(2) required String userName,
    @HiveField(3) required String name,
    @HiveField(4) required String role,
    @HiveField(5) required String status,
  }) = _FanUserModel;

  factory FanUserModel.fromJson(Map<String, dynamic> json) =>
      _$FanUserModelFromJson(json);
}
