import '../database.dart';

class SectorsTable extends SupabaseTable<SectorsRow> {
  @override
  String get tableName => 'Sectors';

  @override
  SectorsRow createRow(Map<String, dynamic> data) => SectorsRow(data);
}

class SectorsRow extends SupabaseDataRow {
  SectorsRow(super.data);

  @override
  SupabaseTable get table => SectorsTable();

  int get sectorID => getField<int>('SectorID')!;
  set sectorID(int value) => setField<int>('SectorID', value);

  String? get sectorName => getField<String>('SectorName');
  set sectorName(String? value) => setField<String>('SectorName', value);
}
