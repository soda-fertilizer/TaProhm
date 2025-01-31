// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserInfoStruct extends BaseStruct {
  UserInfoStruct({
    int? userID,
    String? fullName,
    String? phoneNumber,
    String? token,
    int? sectorID,
    bool? isAdmin,
    String? profile,
    String? userReferral,
    String? hashedPassword,
    bool? isMember,
    bool? isTestAccount,
    String? invite,
    bool? isSubAdmin,
  })  : _userID = userID,
        _fullName = fullName,
        _phoneNumber = phoneNumber,
        _token = token,
        _sectorID = sectorID,
        _isAdmin = isAdmin,
        _profile = profile,
        _userReferral = userReferral,
        _hashedPassword = hashedPassword,
        _isMember = isMember,
        _isTestAccount = isTestAccount,
        _invite = invite,
        _isSubAdmin = isSubAdmin;

  // "UserID" field.
  int? _userID;
  int get userID => _userID ?? 0;
  set userID(int? val) => _userID = val;

  void incrementUserID(int amount) => userID = userID + amount;

  bool hasUserID() => _userID != null;

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

  // "Token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;

  bool hasToken() => _token != null;

  // "SectorID" field.
  int? _sectorID;
  int get sectorID => _sectorID ?? 0;
  set sectorID(int? val) => _sectorID = val;

  void incrementSectorID(int amount) => sectorID = sectorID + amount;

  bool hasSectorID() => _sectorID != null;

  // "IsAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  set isAdmin(bool? val) => _isAdmin = val;

  bool hasIsAdmin() => _isAdmin != null;

  // "Profile" field.
  String? _profile;
  String get profile => _profile ?? '';
  set profile(String? val) => _profile = val;

  bool hasProfile() => _profile != null;

  // "UserReferral" field.
  String? _userReferral;
  String get userReferral => _userReferral ?? '';
  set userReferral(String? val) => _userReferral = val;

  bool hasUserReferral() => _userReferral != null;

  // "HashedPassword" field.
  String? _hashedPassword;
  String get hashedPassword => _hashedPassword ?? '';
  set hashedPassword(String? val) => _hashedPassword = val;

  bool hasHashedPassword() => _hashedPassword != null;

  // "IsMember" field.
  bool? _isMember;
  bool get isMember => _isMember ?? false;
  set isMember(bool? val) => _isMember = val;

  bool hasIsMember() => _isMember != null;

  // "IsTestAccount" field.
  bool? _isTestAccount;
  bool get isTestAccount => _isTestAccount ?? false;
  set isTestAccount(bool? val) => _isTestAccount = val;

  bool hasIsTestAccount() => _isTestAccount != null;

  // "Invite" field.
  String? _invite;
  String get invite => _invite ?? '';
  set invite(String? val) => _invite = val;

  bool hasInvite() => _invite != null;

  // "IsSubAdmin" field.
  bool? _isSubAdmin;
  bool get isSubAdmin => _isSubAdmin ?? false;
  set isSubAdmin(bool? val) => _isSubAdmin = val;

  bool hasIsSubAdmin() => _isSubAdmin != null;

  static UserInfoStruct fromMap(Map<String, dynamic> data) => UserInfoStruct(
        userID: castToType<int>(data['UserID']),
        fullName: data['FullName'] as String?,
        phoneNumber: data['PhoneNumber'] as String?,
        token: data['Token'] as String?,
        sectorID: castToType<int>(data['SectorID']),
        isAdmin: data['IsAdmin'] as bool?,
        profile: data['Profile'] as String?,
        userReferral: data['UserReferral'] as String?,
        hashedPassword: data['HashedPassword'] as String?,
        isMember: data['IsMember'] as bool?,
        isTestAccount: data['IsTestAccount'] as bool?,
        invite: data['Invite'] as String?,
        isSubAdmin: data['IsSubAdmin'] as bool?,
      );

  static UserInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'UserID': _userID,
        'FullName': _fullName,
        'PhoneNumber': _phoneNumber,
        'Token': _token,
        'SectorID': _sectorID,
        'IsAdmin': _isAdmin,
        'Profile': _profile,
        'UserReferral': _userReferral,
        'HashedPassword': _hashedPassword,
        'IsMember': _isMember,
        'IsTestAccount': _isTestAccount,
        'Invite': _invite,
        'IsSubAdmin': _isSubAdmin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'UserID': serializeParam(
          _userID,
          ParamType.int,
        ),
        'FullName': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'PhoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'Token': serializeParam(
          _token,
          ParamType.String,
        ),
        'SectorID': serializeParam(
          _sectorID,
          ParamType.int,
        ),
        'IsAdmin': serializeParam(
          _isAdmin,
          ParamType.bool,
        ),
        'Profile': serializeParam(
          _profile,
          ParamType.String,
        ),
        'UserReferral': serializeParam(
          _userReferral,
          ParamType.String,
        ),
        'HashedPassword': serializeParam(
          _hashedPassword,
          ParamType.String,
        ),
        'IsMember': serializeParam(
          _isMember,
          ParamType.bool,
        ),
        'IsTestAccount': serializeParam(
          _isTestAccount,
          ParamType.bool,
        ),
        'Invite': serializeParam(
          _invite,
          ParamType.String,
        ),
        'IsSubAdmin': serializeParam(
          _isSubAdmin,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserInfoStruct(
        userID: deserializeParam(
          data['UserID'],
          ParamType.int,
          false,
        ),
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
        token: deserializeParam(
          data['Token'],
          ParamType.String,
          false,
        ),
        sectorID: deserializeParam(
          data['SectorID'],
          ParamType.int,
          false,
        ),
        isAdmin: deserializeParam(
          data['IsAdmin'],
          ParamType.bool,
          false,
        ),
        profile: deserializeParam(
          data['Profile'],
          ParamType.String,
          false,
        ),
        userReferral: deserializeParam(
          data['UserReferral'],
          ParamType.String,
          false,
        ),
        hashedPassword: deserializeParam(
          data['HashedPassword'],
          ParamType.String,
          false,
        ),
        isMember: deserializeParam(
          data['IsMember'],
          ParamType.bool,
          false,
        ),
        isTestAccount: deserializeParam(
          data['IsTestAccount'],
          ParamType.bool,
          false,
        ),
        invite: deserializeParam(
          data['Invite'],
          ParamType.String,
          false,
        ),
        isSubAdmin: deserializeParam(
          data['IsSubAdmin'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserInfoStruct &&
        userID == other.userID &&
        fullName == other.fullName &&
        phoneNumber == other.phoneNumber &&
        token == other.token &&
        sectorID == other.sectorID &&
        isAdmin == other.isAdmin &&
        profile == other.profile &&
        userReferral == other.userReferral &&
        hashedPassword == other.hashedPassword &&
        isMember == other.isMember &&
        isTestAccount == other.isTestAccount &&
        invite == other.invite &&
        isSubAdmin == other.isSubAdmin;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userID,
        fullName,
        phoneNumber,
        token,
        sectorID,
        isAdmin,
        profile,
        userReferral,
        hashedPassword,
        isMember,
        isTestAccount,
        invite,
        isSubAdmin
      ]);
}

UserInfoStruct createUserInfoStruct({
  int? userID,
  String? fullName,
  String? phoneNumber,
  String? token,
  int? sectorID,
  bool? isAdmin,
  String? profile,
  String? userReferral,
  String? hashedPassword,
  bool? isMember,
  bool? isTestAccount,
  String? invite,
  bool? isSubAdmin,
}) =>
    UserInfoStruct(
      userID: userID,
      fullName: fullName,
      phoneNumber: phoneNumber,
      token: token,
      sectorID: sectorID,
      isAdmin: isAdmin,
      profile: profile,
      userReferral: userReferral,
      hashedPassword: hashedPassword,
      isMember: isMember,
      isTestAccount: isTestAccount,
      invite: invite,
      isSubAdmin: isSubAdmin,
    );
