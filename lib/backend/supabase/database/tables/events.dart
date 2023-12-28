import '../database.dart';

class EventsTable extends SupabaseTable<EventsRow> {
  @override
  String get tableName => 'Events';

  @override
  EventsRow createRow(Map<String, dynamic> data) => EventsRow(data);
}

class EventsRow extends SupabaseDataRow {
  EventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get title => getField<String>('Title');
  set title(String? value) => setField<String>('Title', value);

  String? get details => getField<String>('Details');
  set details(String? value) => setField<String>('Details', value);

  String? get image => getField<String>('Image');
  set image(String? value) => setField<String>('Image', value);

  DateTime get createdDate => getField<DateTime>('CreatedDate')!;
  set createdDate(DateTime value) => setField<DateTime>('CreatedDate', value);
}
