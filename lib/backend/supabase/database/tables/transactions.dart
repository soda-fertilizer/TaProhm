import '../database.dart';

class TransactionsTable extends SupabaseTable<TransactionsRow> {
  @override
  String get tableName => 'Transactions';

  @override
  TransactionsRow createRow(Map<String, dynamic> data) => TransactionsRow(data);
}

class TransactionsRow extends SupabaseDataRow {
  TransactionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TransactionsTable();

  int get transactionID => getField<int>('TransactionID')!;
  set transactionID(int value) => setField<int>('TransactionID', value);

  int get typeID => getField<int>('TypeID')!;
  set typeID(int value) => setField<int>('TypeID', value);

  int? get productID => getField<int>('ProductID');
  set productID(int? value) => setField<int>('ProductID', value);

  double get amount => getField<double>('Amount')!;
  set amount(double value) => setField<double>('Amount', value);

  DateTime? get createdDate => getField<DateTime>('CreatedDate');
  set createdDate(DateTime? value) => setField<DateTime>('CreatedDate', value);

  String? get image => getField<String>('Image');
  set image(String? value) => setField<String>('Image', value);

  bool get isApprove => getField<bool>('IsApprove')!;
  set isApprove(bool value) => setField<bool>('IsApprove', value);

  String? get userPhoneNumber => getField<String>('UserPhoneNumber');
  set userPhoneNumber(String? value) =>
      setField<String>('UserPhoneNumber', value);

  String? get transferToUserPhoneNumber =>
      getField<String>('TransferToUserPhoneNumber');
  set transferToUserPhoneNumber(String? value) =>
      setField<String>('TransferToUserPhoneNumber', value);

  String? get detail => getField<String>('Detail');
  set detail(String? value) => setField<String>('Detail', value);
}
