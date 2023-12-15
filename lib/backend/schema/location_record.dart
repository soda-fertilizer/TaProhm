import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationRecord extends FirestoreRecord {
  LocationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "UserID" field.
  int? _userID;
  int get userID => _userID ?? 0;
  bool hasUserID() => _userID != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _userID = castToType<int>(snapshotData['UserID']);
    _location = snapshotData['Location'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Location');

  static Stream<LocationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocationRecord.fromSnapshot(s));

  static Future<LocationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocationRecord.fromSnapshot(s));

  static LocationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocationRecordData({
  int? userID,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UserID': userID,
      'Location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocationRecordDocumentEquality implements Equality<LocationRecord> {
  const LocationRecordDocumentEquality();

  @override
  bool equals(LocationRecord? e1, LocationRecord? e2) {
    return e1?.userID == e2?.userID && e1?.location == e2?.location;
  }

  @override
  int hash(LocationRecord? e) =>
      const ListEquality().hash([e?.userID, e?.location]);

  @override
  bool isValidKey(Object? o) => o is LocationRecord;
}
