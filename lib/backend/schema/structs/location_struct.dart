// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationStruct extends FFFirebaseStruct {
  LocationStruct({
    int? userID,
    LatLng? location,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userID = userID,
        _location = location,
        super(firestoreUtilData);

  // "UserID" field.
  int? _userID;
  int get userID => _userID ?? 0;
  set userID(int? val) => _userID = val;
  void incrementUserID(int amount) => _userID = userID + amount;
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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocationStruct(
      userID: userID,
      location: location,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocationStruct? updateLocationStruct(
  LocationStruct? locationStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    locationStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocationStructData(
  Map<String, dynamic> firestoreData,
  LocationStruct? locationStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (locationStruct == null) {
    return;
  }
  if (locationStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && locationStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final locationStructData =
      getLocationFirestoreData(locationStruct, forFieldValue);
  final nestedData =
      locationStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = locationStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocationFirestoreData(
  LocationStruct? locationStruct, [
  bool forFieldValue = false,
]) {
  if (locationStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(locationStruct.toMap());

  // Add any Firestore field values
  locationStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocationListFirestoreData(
  List<LocationStruct>? locationStructs,
) =>
    locationStructs?.map((e) => getLocationFirestoreData(e, true)).toList() ??
    [];
