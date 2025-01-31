import '../database.dart';

class NotificationTable extends SupabaseTable<NotificationRow> {
  @override
  String get tableName => 'Notification';

  @override
  NotificationRow createRow(Map<String, dynamic> data) => NotificationRow(data);
}

class NotificationRow extends SupabaseDataRow {
  NotificationRow(super.data);

  @override
  SupabaseTable get table => NotificationTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get title => getField<String>('Title')!;
  set title(String value) => setField<String>('Title', value);

  String get contents => getField<String>('Contents')!;
  set contents(String value) => setField<String>('Contents', value);

  DateTime get createdDate => getField<DateTime>('CreatedDate')!;
  set createdDate(DateTime value) => setField<DateTime>('CreatedDate', value);

  int get userID => getField<int>('UserID')!;
  set userID(int value) => setField<int>('UserID', value);
}
