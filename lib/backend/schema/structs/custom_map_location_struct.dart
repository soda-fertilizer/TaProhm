// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomMapLocationStruct extends FFFirebaseStruct {
  CustomMapLocationStruct({
    int? id,
    double? latitude,
    double? longitude,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _latitude = latitude,
        _longitude = longitude,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  set latitude(double? val) => _latitude = val;
  void incrementLatitude(double amount) => _latitude = latitude + amount;
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  set longitude(double? val) => _longitude = val;
  void incrementLongitude(double amount) => _longitude = longitude + amount;
  bool hasLongitude() => _longitude != null;

  static CustomMapLocationStruct fromMap(Map<String, dynamic> data) =>
      CustomMapLocationStruct(
        id: castToType<int>(data['id']),
        latitude: castToType<double>(data['latitude']),
        longitude: castToType<double>(data['longitude']),
      );

  static CustomMapLocationStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? CustomMapLocationStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'latitude': _latitude,
        'longitude': _longitude,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
      }.withoutNulls;

  static CustomMapLocationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CustomMapLocationStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.double,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CustomMapLocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomMapLocationStruct &&
        id == other.id &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode => const ListEquality().hash([id, latitude, longitude]);
}

CustomMapLocationStruct createCustomMapLocationStruct({
  int? id,
  double? latitude,
  double? longitude,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CustomMapLocationStruct(
      id: id,
      latitude: latitude,
      longitude: longitude,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CustomMapLocationStruct? updateCustomMapLocationStruct(
  CustomMapLocationStruct? customMapLocation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    customMapLocation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCustomMapLocationStructData(
  Map<String, dynamic> firestoreData,
  CustomMapLocationStruct? customMapLocation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (customMapLocation == null) {
    return;
  }
  if (customMapLocation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && customMapLocation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final customMapLocationData =
      getCustomMapLocationFirestoreData(customMapLocation, forFieldValue);
  final nestedData =
      customMapLocationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = customMapLocation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCustomMapLocationFirestoreData(
  CustomMapLocationStruct? customMapLocation, [
  bool forFieldValue = false,
]) {
  if (customMapLocation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(customMapLocation.toMap());

  // Add any Firestore field values
  customMapLocation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCustomMapLocationListFirestoreData(
  List<CustomMapLocationStruct>? customMapLocations,
) =>
    customMapLocations
        ?.map((e) => getCustomMapLocationFirestoreData(e, true))
        .toList() ??
    [];
