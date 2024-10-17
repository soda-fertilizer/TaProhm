// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationStruct extends BaseStruct {
  LocationStruct({
    int? userID,
    LatLng? location,
  })  : _userID = userID,
        _location = location;

  // "UserID" field.
  int? _userID;
  int get userID => _userID ?? 0;
  set userID(int? val) => _userID = val;

  void incrementUserID(int amount) => userID = userID + amount;

  bool hasUserID() => _userID != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;

  bool hasLocation() => _location != null;

  static LocationStruct fromMap(Map<String, dynamic> data) => LocationStruct(
        userID: castToType<int>(data['UserID']),
        location: data['Location'] as LatLng?,
      );

  static LocationStruct? maybeFromMap(dynamic data) =>
      data is Map ? LocationStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'UserID': _userID,
        'Location': _location,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'UserID': serializeParam(
          _userID,
          ParamType.int,
        ),
        'Location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static LocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationStruct(
        userID: deserializeParam(
          data['UserID'],
          ParamType.int,
          false,
        ),
        location: deserializeParam(
          data['Location'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'LocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationStruct &&
        userID == other.userID &&
        location == other.location;
  }

  @override
  int get hashCode => const ListEquality().hash([userID, location]);
}

LocationStruct createLocationStruct({
  int? userID,
  LatLng? location,
}) =>
    LocationStruct(
      userID: userID,
      location: location,
    );
