import '../database.dart';

class BroadcastNotificationTable
    extends SupabaseTable<BroadcastNotificationRow> {
  @override
  String get tableName => 'BroadcastNotification';

  @override
  BroadcastNotificationRow createRow(Map<String, dynamic> data) =>
      BroadcastNotificationRow(data);
}

class BroadcastNotificationRow extends SupabaseDataRow {
  BroadcastNotificationRow(super.data);

  @override
  SupabaseTable get table => BroadcastNotificationTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get title => getField<String>('Title')!;
  set title(String value) => setField<String>('Title', value);

  String get contents => getField<String>('Contents')!;
  set contents(String value) => setField<String>('Contents', value);

  DateTime get createdDate => getField<DateTime>('CreatedDate')!;
  set createdDate(DateTime value) => setField<DateTime>('CreatedDate', value);

  int? get createdBy => getField<int>('CreatedBy');
  set createdBy(int? value) => setField<int>('CreatedBy', value);

  String get image => getField<String>('Image')!;
  set image(String value) => setField<String>('Image', value);
}
