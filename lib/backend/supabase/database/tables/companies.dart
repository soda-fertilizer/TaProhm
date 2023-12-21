import '../database.dart';

class CompaniesTable extends SupabaseTable<CompaniesRow> {
  @override
  String get tableName => 'Companies';

  @override
  CompaniesRow createRow(Map<String, dynamic> data) => CompaniesRow(data);
}

class CompaniesRow extends SupabaseDataRow {
  CompaniesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CompaniesTable();

  int get companyID => getField<int>('CompanyID')!;
  set companyID(int value) => setField<int>('CompanyID', value);

  int get userID => getField<int>('UserID')!;
  set userID(int value) => setField<int>('UserID', value);

  String get companyName => getField<String>('CompanyName')!;
  set companyName(String value) => setField<String>('CompanyName', value);

  String get companyProfile => getField<String>('CompanyProfile')!;
  set companyProfile(String value) => setField<String>('CompanyProfile', value);

  List<String> get companyImages => getListField<String>('CompanyImages')!;
  set companyImages(List<String> value) =>
      setListField<String>('CompanyImages', value);

  String get phoneNumber => getField<String>('PhoneNumber')!;
  set phoneNumber(String value) => setField<String>('PhoneNumber', value);

  String get telegramUrl => getField<String>('TelegramUrl')!;
  set telegramUrl(String value) => setField<String>('TelegramUrl', value);

  String get detail => getField<String>('Detail')!;
  set detail(String value) => setField<String>('Detail', value);

  double get latitude => getField<double>('Latitude')!;
  set latitude(double value) => setField<double>('Latitude', value);

  double get longitude => getField<double>('Longitude')!;
  set longitude(double value) => setField<double>('Longitude', value);

  String get paymentImage => getField<String>('PaymentImage')!;
  set paymentImage(String value) => setField<String>('PaymentImage', value);

  bool get isApprove => getField<bool>('IsApprove')!;
  set isApprove(bool value) => setField<bool>('IsApprove', value);

  bool get isActive => getField<bool>('IsActive')!;
  set isActive(bool value) => setField<bool>('IsActive', value);

  bool get isVertify => getField<bool>('IsVertify')!;
  set isVertify(bool value) => setField<bool>('IsVertify', value);

  double get discount => getField<double>('Discount')!;
  set discount(double value) => setField<double>('Discount', value);

  DateTime? get createdDate => getField<DateTime>('CreatedDate');
  set createdDate(DateTime? value) => setField<DateTime>('CreatedDate', value);

  double get amount => getField<double>('Amount')!;
  set amount(double value) => setField<double>('Amount', value);
}
