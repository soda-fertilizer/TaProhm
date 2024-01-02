// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CollectionTypeStruct extends FFFirebaseStruct {
  CollectionTypeStruct({
    DocumentReference? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _value = value,
        super(firestoreUtilData);

  // "value" field.
  DocumentReference? _value;
  DocumentReference? get value => _value;
  set value(DocumentReference? val) => _value = val;
  bool hasValue() => _value != null;

  static CollectionTypeStruct fromMap(Map<String, dynamic> data) =>
      CollectionTypeStruct(
        value: data['value'] as DocumentReference?,
      );

  static CollectionTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? CollectionTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'value': serializeParam(
          _value,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CollectionTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      CollectionTypeStruct(
        value: deserializeParam(
          data['value'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Location'],
        ),
      );

  @override
  String toString() => 'CollectionTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CollectionTypeStruct && value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([value]);
}

CollectionTypeStruct createCollectionTypeStruct({
  DocumentReference? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CollectionTypeStruct(
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CollectionTypeStruct? updateCollectionTypeStruct(
  CollectionTypeStruct? collectionType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    collectionType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCollectionTypeStructData(
  Map<String, dynamic> firestoreData,
  CollectionTypeStruct? collectionType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (collectionType == null) {
    return;
  }
  if (collectionType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && collectionType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final collectionTypeData =
      getCollectionTypeFirestoreData(collectionType, forFieldValue);
  final nestedData =
      collectionTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = collectionType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCollectionTypeFirestoreData(
  CollectionTypeStruct? collectionType, [
  bool forFieldValue = false,
]) {
  if (collectionType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(collectionType.toMap());

  // Add any Firestore field values
  collectionType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCollectionTypeListFirestoreData(
  List<CollectionTypeStruct>? collectionTypes,
) =>
    collectionTypes
        ?.map((e) => getCollectionTypeFirestoreData(e, true))
        .toList() ??
    [];
