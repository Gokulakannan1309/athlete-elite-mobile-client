import 'package:freezed_annotation/freezed_annotation.dart';

part 'athlete_login_requested.freezed.dart';
part 'athlete_login_requested.g.dart';

@freezed
class AthleteLoginRequested with _$AthleteLoginRequested {
  const factory AthleteLoginRequested({
    required String identifier,
    required String password,
  }) = _AthleteLoginRequested;

  factory AthleteLoginRequested.fromJson(Map<String, dynamic> json) =>
      _$AthleteLoginRequestedFromJson(json);
}
