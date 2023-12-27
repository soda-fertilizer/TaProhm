import '../database.dart';

class LogsTable extends SupabaseTable<LogsRow> {
  @override
  String get tableName => 'Logs';

  @override
  LogsRow createRow(Map<String, dynamic> data) => LogsRow(data);
}

class LogsRow extends SupabaseDataRow {
  LogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LogsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get title => getField<String>('Title');
  set title(String? value) => setField<String>('Title', value);

  String? get details => getField<String>('Details');
  set details(String? value) => setField<String>('Details', value);

  DateTime get createdDate => getField<DateTime>('CreatedDate')!;
  set createdDate(DateTime value) => setField<DateTime>('CreatedDate', value);
}
