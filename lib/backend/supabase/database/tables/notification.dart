import '../database.dart';

class NotificationTable extends SupabaseTable<NotificationRow> {
  @override
  String get tableName => 'Notification';

  @override
  NotificationRow createRow(Map<String, dynamic> data) => NotificationRow(data);
}

class NotificationRow extends SupabaseDataRow {
  NotificationRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationTable();

  int get notificationID => getField<int>('NotificationID')!;
  set notificationID(int value) => setField<int>('NotificationID', value);

  String get userToken => getField<String>('UserToken')!;
  set userToken(String value) => setField<String>('UserToken', value);

  String get title => getField<String>('Title')!;
  set title(String value) => setField<String>('Title', value);

  String get contents => getField<String>('Contents')!;
  set contents(String value) => setField<String>('Contents', value);

  DateTime get createdDate => getField<DateTime>('CreatedDate')!;
  set createdDate(DateTime value) => setField<DateTime>('CreatedDate', value);
}
