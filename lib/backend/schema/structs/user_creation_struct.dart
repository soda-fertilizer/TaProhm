// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCreationStruct extends BaseStruct {
  UserCreationStruct({
    String? fullName,
    String? phoneNumber,
    String? password,
    int? sectorID,
    String? sectorName,
    String? pymentImage,
    String? profile,
    String? invidePhonenumber,
  })  : _fullName = fullName,
        _phoneNumber = phoneNumber,
        _password = password,
        _sectorID = sectorID,
        _sectorName = sectorName,
        _pymentImage = pymentImage,
        _profile = profile,
        _invidePhonenumber = invidePhonenumber;

  // "FullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "PhoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "Password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  // "SectorID" field.
  int? _sectorID;
  int get sectorID => _sectorID ?? 0;
  set sectorID(int? val) => _sectorID = val;

  void incrementSectorID(int amount) => sectorID = sectorID + amount;

  bool hasSectorID() => _sectorID != null;

  // "SectorName" field.
  String? _sectorName;
  String get sectorName => _sectorName ?? '';
  set sectorName(String? val) => _sectorName = val;

  bool hasSectorName() => _sectorName != null;

  // "PymentImage" field.
  String? _pymentImage;
  String get pymentImage => _pymentImage ?? '';
  set pymentImage(String? val) => _pymentImage = val;

  bool hasPymentImage() => _pymentImage != null;

  // "Profile" field.
  String? _profile;
  String get profile => _profile ?? '';
  set profile(String? val) => _profile = val;

  bool hasProfile() => _profile != null;

  // "InvidePhonenumber" field.
  String? _invidePhonenumber;
  String get invidePhonenumber => _invidePhonenumber ?? '';
  set invidePhonenumber(String? val) => _invidePhonenumber = val;

  bool hasInvidePhonenumber() => _invidePhonenumber != null;

  static UserCreationStruct fromMap(Map<String, dynamic> data) =>
      UserCreationStruct(
        fullName: data['FullName'] as String?,
        phoneNumber: data['PhoneNumber'] as String?,
        password: data['Password'] as String?,
        sectorID: castToType<int>(data['SectorID']),
        sectorName: data['SectorName'] as String?,
        pymentImage: data['PymentImage'] as String?,
        profile: data['Profile'] as String?,
        invidePhonenumber: data['InvidePhonenumber'] as String?,
      );

  static UserCreationStruct? maybeFromMap(dynamic data) => data is Map
      ? UserCreationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'FullName': _fullName,
        'PhoneNumber': _phoneNumber,
        'Password': _password,
        'SectorID': _sectorID,
        'SectorName': _sectorName,
        'PymentImage': _pymentImage,
        'Profile': _profile,
        'InvidePhonenumber': _invidePhonenumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'FullName': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'PhoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'Password': serializeParam(
          _password,
          ParamType.String,
        ),
        'SectorID': serializeParam(
          _sectorID,
          ParamType.int,
        ),
        'SectorName': serializeParam(
          _sectorName,
          ParamType.String,
        ),
        'PymentImage': serializeParam(
          _pymentImage,
          ParamType.String,
        ),
        'Profile': serializeParam(
          _profile,
          ParamType.String,
        ),
        'InvidePhonenumber': serializeParam(
          _invidePhonenumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserCreationStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserCreationStruct(
        fullName: deserializeParam(
          data['FullName'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['PhoneNumber'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['Password'],
          ParamType.String,
          false,
        ),
        sectorID: deserializeParam(
          data['SectorID'],
          ParamType.int,
          false,
        ),
        sectorName: deserializeParam(
          data['SectorName'],
          ParamType.String,
          false,
        ),
        pymentImage: deserializeParam(
          data['PymentImage'],
          ParamType.String,
          false,
        ),
        profile: deserializeParam(
          data['Profile'],
          ParamType.String,
          false,
        ),
        invidePhonenumber: deserializeParam(
          data['InvidePhonenumber'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserCreationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserCreationStruct &&
        fullName == other.fullName &&
        phoneNumber == other.phoneNumber &&
        password == other.password &&
        sectorID == other.sectorID &&
        sectorName == other.sectorName &&
        pymentImage == other.pymentImage &&
        profile == other.profile &&
        invidePhonenumber == other.invidePhonenumber;
  }

  @override
  int get hashCode => const ListEquality().hash([
        fullName,
        phoneNumber,
        password,
        sectorID,
        sectorName,
        pymentImage,
        profile,
        invidePhonenumber
      ]);
}

UserCreationStruct createUserCreationStruct({
  String? fullName,
  String? phoneNumber,
  String? password,
  int? sectorID,
  String? sectorName,
  String? pymentImage,
  String? profile,
  String? invidePhonenumber,
}) =>
    UserCreationStruct(
      fullName: fullName,
      phoneNumber: phoneNumber,
      password: password,
      sectorID: sectorID,
      sectorName: sectorName,
      pymentImage: pymentImage,
      profile: profile,
      invidePhonenumber: invidePhonenumber,
    );
