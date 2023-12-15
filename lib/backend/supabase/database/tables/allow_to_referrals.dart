import '../database.dart';

class AllowToReferralsTable extends SupabaseTable<AllowToReferralsRow> {
  @override
  String get tableName => 'AllowToReferrals';

  @override
  AllowToReferralsRow createRow(Map<String, dynamic> data) =>
      AllowToReferralsRow(data);
}

class AllowToReferralsRow extends SupabaseDataRow {
  AllowToReferralsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AllowToReferralsTable();

  int get allowToReferralID => getField<int>('AllowToReferralID')!;
  set allowToReferralID(int value) => setField<int>('AllowToReferralID', value);

  String get userPhoneNumber => getField<String>('UserPhoneNumber')!;
  set userPhoneNumber(String value) =>
      setField<String>('UserPhoneNumber', value);
}
