import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_position.freezed.dart';
part 'remote_position.g.dart';

@freezed
class RemotePosition with _$RemotePosition{
  const factory RemotePosition({required double lat, required double lon}) = _RemotePosition;

  factory RemotePosition.fromJson(Map<String, Object?> json) => _$RemotePositionFromJson(json);
}