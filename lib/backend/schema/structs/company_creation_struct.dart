// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyCreationStruct extends FFFirebaseStruct {
  CompanyCreationStruct({
    String? profile,
    String? name,
    String? phoneNumber,
    LatLng? location,
    String? telegramLink,
    String? details,
    List<String>? imageDetails,
    bool? isVertify,
    int? discount,
    String? pymentImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _profile = profile,
        _name = name,
        _phoneNumber = phoneNumber,
        _location = location,
        _telegramLink = telegramLink,
        _details = details,
        _imageDetails = imageDetails,
        _isVertify = isVertify,
        _discount = discount,
        _pymentImage = pymentImage,
        super(firestoreUtilData);

  // "Profile" field.
  String? _profile;
  String get profile => _profile ?? '';
  set profile(String? val) => _profile = val;
  bool hasProfile() => _profile != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "PhoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;
  bool hasLocation() => _location != null;

  // "TelegramLink" field.
  String? _telegramLink;
  String get telegramLink => _telegramLink ?? '';
  set telegramLink(String? val) => _telegramLink = val;
  bool hasTelegramLink() => _telegramLink != null;

  // "Details" field.
  String? _details;
  String get details => _details ?? '';
  set details(String? val) => _details = val;
  bool hasDetails() => _details != null;

  // "ImageDetails" field.
  List<String>? _imageDetails;
  List<String> get imageDetails => _imageDetails ?? const [];
  set imageDetails(List<String>? val) => _imageDetails = val;
  void updateImageDetails(Function(List<String>) updateFn) =>
      updateFn(_imageDetails ??= []);
  bool hasImageDetails() => _imageDetails != null;

  // "IsVertify" field.
  bool? _isVertify;
  bool get isVertify => _isVertify ?? false;
  set isVertify(bool? val) => _isVertify = val;
  bool hasIsVertify() => _isVertify != null;

  // "Discount" field.
  int? _discount;
  int get discount => _discount ?? 0;
  set discount(int? val) => _discount = val;
  void incrementDiscount(int amount) => _discount = discount + amount;
  bool hasDiscount() => _discount != null;

  // "PymentImage" field.
  String? _pymentImage;
  String get pymentImage => _pymentImage ?? '';
  set pymentImage(String? val) => _pymentImage = val;
  bool hasPymentImage() => _pymentImage != null;

  static CompanyCreationStruct fromMap(Map<String, dynamic> data) =>
      CompanyCreationStruct(
        profile: data['Profile'] as String?,
        name: data['Name'] as String?,
        phoneNumber: data['PhoneNumber'] as String?,
        location: data['Location'] as LatLng?,
        telegramLink: data['TelegramLink'] as String?,
        details: data['Details'] as String?,
        imageDetails: getDataList(data['ImageDetails']),
        isVertify: data['IsVertify'] as bool?,
        discount: castToType<int>(data['Discount']),
        pymentImage: data['PymentImage'] as String?,
      );

  static CompanyCreationStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CompanyCreationStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Profile': _profile,
        'Name': _name,
        'PhoneNumber': _phoneNumber,
        'Location': _location,
        'TelegramLink': _telegramLink,
        'Details': _details,
        'ImageDetails': _imageDetails,
        'IsVertify': _isVertify,
        'Discount': _discount,
        'PymentImage': _pymentImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Profile': serializeParam(
          _profile,
          ParamType.String,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'PhoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'Location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
        'TelegramLink': serializeParam(
          _telegramLink,
          ParamType.String,
        ),
        'Details': serializeParam(
          _details,
          ParamType.String,
        ),
        'ImageDetails': serializeParam(
          _imageDetails,
          ParamType.String,
          true,
        ),
        'IsVertify': serializeParam(
          _isVertify,
          ParamType.bool,
        ),
        'Discount': serializeParam(
          _discount,
          ParamType.int,
        ),
        'PymentImage': serializeParam(
          _pymentImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static CompanyCreationStruct fromSerializableMap(Map<String, dynamic> data) =>
      CompanyCreationStruct(
        profile: deserializeParam(
          data['Profile'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['PhoneNumber'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['Location'],
          ParamType.LatLng,
          false,
        ),
        telegramLink: deserializeParam(
          data['TelegramLink'],
          ParamType.String,
          false,
        ),
        details: deserializeParam(
          data['Details'],
          ParamType.String,
          false,
        ),
        imageDetails: deserializeParam<String>(
          data['ImageDetails'],
          ParamType.String,
          true,
        ),
        isVertify: deserializeParam(
          data['IsVertify'],
          ParamType.bool,
          false,
        ),
        discount: deserializeParam(
          data['Discount'],
          ParamType.int,
          false,
        ),
        pymentImage: deserializeParam(
          data['PymentImage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CompanyCreationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CompanyCreationStruct &&
        profile == other.profile &&
        name == other.name &&
        phoneNumber == other.phoneNumber &&
        location == other.location &&
        telegramLink == other.telegramLink &&
        details == other.details &&
        listEquality.equals(imageDetails, other.imageDetails) &&
        isVertify == other.isVertify &&
        discount == other.discount &&
        pymentImage == other.pymentImage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        profile,
        name,
        phoneNumber,
        location,
        telegramLink,
        details,
        imageDetails,
        isVertify,
        discount,
        pymentImage
      ]);
}

CompanyCreationStruct createCompanyCreationStruct({
  String? profile,
  String? name,
  String? phoneNumber,
  LatLng? location,
  String? telegramLink,
  String? details,
  bool? isVertify,
  int? discount,
  String? pymentImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CompanyCreationStruct(
      profile: profile,
      name: name,
      phoneNumber: phoneNumber,
      location: location,
      telegramLink: telegramLink,
      details: details,
      isVertify: isVertify,
      discount: discount,
      pymentImage: pymentImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CompanyCreationStruct? updateCompanyCreationStruct(
  CompanyCreationStruct? companyCreation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    companyCreation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCompanyCreationStructData(
  Map<String, dynamic> firestoreData,
  CompanyCreationStruct? companyCreation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (companyCreation == null) {
    return;
  }
  if (companyCreation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && companyCreation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final companyCreationData =
      getCompanyCreationFirestoreData(companyCreation, forFieldValue);
  final nestedData =
      companyCreationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = companyCreation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCompanyCreationFirestoreData(
  CompanyCreationStruct? companyCreation, [
  bool forFieldValue = false,
]) {
  if (companyCreation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(companyCreation.toMap());

  // Add any Firestore field values
  companyCreation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCompanyCreationListFirestoreData(
  List<CompanyCreationStruct>? companyCreations,
) =>
    companyCreations
        ?.map((e) => getCompanyCreationFirestoreData(e, true))
        .toList() ??
    [];
