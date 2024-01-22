import '../database.dart';

class CompaniesRatingTable extends SupabaseTable<CompaniesRatingRow> {
  @override
  String get tableName => 'CompaniesRating';

  @override
  CompaniesRatingRow createRow(Map<String, dynamic> data) =>
      CompaniesRatingRow(data);
}

class CompaniesRatingRow extends SupabaseDataRow {
  CompaniesRatingRow(super.data);

  @override
  SupabaseTable get table => CompaniesRatingTable();

  int get id => getField<int>('ID')!;
  set id(int value) => setField<int>('ID', value);

  int get userID => getField<int>('UserID')!;
  set userID(int value) => setField<int>('UserID', value);

  int get companyID => getField<int>('CompanyID')!;
  set companyID(int value) => setField<int>('CompanyID', value);

  int? get rating => getField<int>('Rating');
  set rating(int? value) => setField<int>('Rating', value);

  String? get detail => getField<String>('Detail');
  set detail(String? value) => setField<String>('Detail', value);

  DateTime get createdDate => getField<DateTime>('CreatedDate')!;
  set createdDate(DateTime value) => setField<DateTime>('CreatedDate', value);
}
