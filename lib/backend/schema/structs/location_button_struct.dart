// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationButtonStruct extends BaseStruct {
  LocationButtonStruct({
    String? province,
    LatLng? location,
  })  : _province = province,
        _location = location;

  // "province" field.
  String? _province;
  String get province => _province ?? '';
  set province(String? val) => _province = val;

  bool hasProvince() => _province != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;

  bool hasLocation() => _location != null;

  static LocationButtonStruct fromMap(Map<String, dynamic> data) =>
      LocationButtonStruct(
        province: data['province'] as String?,
        location: data['location'] as LatLng?,
      );

  static LocationButtonStruct? maybeFromMap(dynamic data) => data is Map
      ? LocationButtonStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'province': _province,
        'location': _location,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'province': serializeParam(
          _province,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static LocationButtonStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationButtonStruct(
        province: deserializeParam(
          data['province'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'LocationButtonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationButtonStruct &&
        province == other.province &&
        location == other.location;
  }

  @override
  int get hashCode => const ListEquality().hash([province, location]);
}

LocationButtonStruct createLocationButtonStruct({
  String? province,
  LatLng? location,
}) =>
    LocationButtonStruct(
      province: province,
      location: location,
    );
