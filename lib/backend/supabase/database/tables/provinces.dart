import '../database.dart';

class ProvincesTable extends SupabaseTable<ProvincesRow> {
  @override
  String get tableName => 'Provinces';

  @override
  ProvincesRow createRow(Map<String, dynamic> data) => ProvincesRow(data);
}

class ProvincesRow extends SupabaseDataRow {
  ProvincesRow(super.data);

  @override
  SupabaseTable get table => ProvincesTable();

  int get provinceID => getField<int>('ProvinceID')!;
  set provinceID(int value) => setField<int>('ProvinceID', value);

  String get provinceName => getField<String>('ProvinceName')!;
  set provinceName(String value) => setField<String>('ProvinceName', value);

  double? get latitude => getField<double>('Latitude');
  set latitude(double? value) => setField<double>('Latitude', value);

  double? get longitude => getField<double>('Longitude');
  set longitude(double? value) => setField<double>('Longitude', value);
}
