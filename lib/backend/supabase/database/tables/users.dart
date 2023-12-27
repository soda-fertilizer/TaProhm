import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'Users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  int get userID => getField<int>('UserID')!;
  set userID(int value) => setField<int>('UserID', value);

  String get phoneNumber => getField<String>('PhoneNumber')!;
  set phoneNumber(String value) => setField<String>('PhoneNumber', value);

  String get password => getField<String>('Password')!;
  set password(String value) => setField<String>('Password', value);

  String get token => getField<String>('Token')!;
  set token(String value) => setField<String>('Token', value);

  bool get isApprove => getField<bool>('IsApprove')!;
  set isApprove(bool value) => setField<bool>('IsApprove', value);

  String? get paymentImage => getField<String>('PaymentImage');
  set paymentImage(String? value) => setField<String>('PaymentImage', value);

  bool get isActive => getField<bool>('IsActive')!;
  set isActive(bool value) => setField<bool>('IsActive', value);

  double get balance => getField<double>('Balance')!;
  set balance(double value) => setField<double>('Balance', value);

  int? get sectorID => getField<int>('SectorID');
  set sectorID(int? value) => setField<int>('SectorID', value);

  DateTime get createdDate => getField<DateTime>('CreatedDate')!;
  set createdDate(DateTime value) => setField<DateTime>('CreatedDate', value);

  bool get isAdmin => getField<bool>('IsAdmin')!;
  set isAdmin(bool value) => setField<bool>('IsAdmin', value);

  String get profile => getField<String>('Profile')!;
  set profile(String value) => setField<String>('Profile', value);

  String get fullName => getField<String>('FullName')!;
  set fullName(String value) => setField<String>('FullName', value);

  String? get userReferral => getField<String>('UserReferral');
  set userReferral(String? value) => setField<String>('UserReferral', value);

  bool get isSectorHead => getField<bool>('IsSectorHead')!;
  set isSectorHead(bool value) => setField<bool>('IsSectorHead', value);

  bool get isMember => getField<bool>('IsMember')!;
  set isMember(bool value) => setField<bool>('IsMember', value);

  bool get isTestAccount => getField<bool>('IsTestAccount')!;
  set isTestAccount(bool value) => setField<bool>('IsTestAccount', value);

  String? get invite => getField<String>('Invite');
  set invite(String? value) => setField<String>('Invite', value);

  bool get isSubAdmin => getField<bool>('IsSubAdmin')!;
  set isSubAdmin(bool value) => setField<bool>('IsSubAdmin', value);
}
