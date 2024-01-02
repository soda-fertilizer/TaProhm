import '../database.dart';

class TransactionTypesTable extends SupabaseTable<TransactionTypesRow> {
  @override
  String get tableName => 'TransactionTypes';

  @override
  TransactionTypesRow createRow(Map<String, dynamic> data) =>
      TransactionTypesRow(data);
}

class TransactionTypesRow extends SupabaseDataRow {
  TransactionTypesRow(super.data);

  @override
  SupabaseTable get table => TransactionTypesTable();

  int get transactionTypeID => getField<int>('TransactionTypeID')!;
  set transactionTypeID(int value) => setField<int>('TransactionTypeID', value);

  String get type => getField<String>('Type')!;
  set type(String value) => setField<String>('Type', value);
}
