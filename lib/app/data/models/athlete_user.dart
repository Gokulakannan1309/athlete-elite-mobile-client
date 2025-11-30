import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'athlete_user.freezed.dart';
part 'athlete_user.g.dart';

@freezed
@HiveType(typeId: 1)
class AthleteUser with _$AthleteUser {
  const factory AthleteUser({
    @HiveField(0) required String id,
    @HiveField(1) required String email,
    // @HiveField(2) required String userName,
    @HiveField(2) required String name,
    @HiveField(3) required String role,
    @HiveField(4) required String status,
    @HiveField(5) @Default(false) bool firstTimeLogin,
  }) = _AthleteUser;

  factory AthleteUser.fromJson(Map<String, dynamic> json) =>
      _$AthleteUserFromJson(json);
}
