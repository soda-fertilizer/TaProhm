import '../database.dart';

class DistrictsTable extends SupabaseTable<DistrictsRow> {
  @override
  String get tableName => 'Districts';

  @override
  DistrictsRow createRow(Map<String, dynamic> data) => DistrictsRow(data);
}

class DistrictsRow extends SupabaseDataRow {
  DistrictsRow(super.data);

  @override
  SupabaseTable get table => DistrictsTable();

  int get provinceID => getField<int>('ProvinceID')!;
  set provinceID(int value) => setField<int>('ProvinceID', value);

  int get districtID => getField<int>('DistrictID')!;
  set districtID(int value) => setField<int>('DistrictID', value);

  String get districtName => getField<String>('DistrictName')!;
  set districtName(String value) => setField<String>('DistrictName', value);

  double? get latitude => getField<double>('Latitude');
  set latitude(double? value) => setField<double>('Latitude', value);

  double? get longitude => getField<double>('Longitude');
  set longitude(double? value) => setField<double>('Longitude', value);
}
