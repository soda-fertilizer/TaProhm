// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationButtonStruct extends FFFirebaseStruct {
  LocationButtonStruct({
    String? province,
    LatLng? location,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _province = province,
        _location = location,
        super(firestoreUtilData);

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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocationButtonStruct(
      province: province,
      location: location,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocationButtonStruct? updateLocationButtonStruct(
  LocationButtonStruct? locationButton, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    locationButton
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocationButtonStructData(
  Map<String, dynamic> firestoreData,
  LocationButtonStruct? locationButton,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (locationButton == null) {
    return;
  }
  if (locationButton.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && locationButton.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final locationButtonData =
      getLocationButtonFirestoreData(locationButton, forFieldValue);
  final nestedData =
      locationButtonData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = locationButton.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocationButtonFirestoreData(
  LocationButtonStruct? locationButton, [
  bool forFieldValue = false,
]) {
  if (locationButton == null) {
    return {};
  }
  final firestoreData = mapToFirestore(locationButton.toMap());

  // Add any Firestore field values
  locationButton.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocationButtonListFirestoreData(
  List<LocationButtonStruct>? locationButtons,
) =>
    locationButtons
        ?.map((e) => getLocationButtonFirestoreData(e, true))
        .toList() ??
    [];
