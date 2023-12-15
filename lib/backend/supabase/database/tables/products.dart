import '../database.dart';

class ProductsTable extends SupabaseTable<ProductsRow> {
  @override
  String get tableName => 'Products';

  @override
  ProductsRow createRow(Map<String, dynamic> data) => ProductsRow(data);
}

class ProductsRow extends SupabaseDataRow {
  ProductsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProductsTable();

  int get productID => getField<int>('ProductID')!;
  set productID(int value) => setField<int>('ProductID', value);

  String get productName => getField<String>('ProductName')!;
  set productName(String value) => setField<String>('ProductName', value);

  List<String> get productImages => getListField<String>('ProductImages')!;
  set productImages(List<String> value) =>
      setListField<String>('ProductImages', value);

  double get productPrice => getField<double>('ProductPrice')!;
  set productPrice(double value) => setField<double>('ProductPrice', value);

  String get productDetail => getField<String>('ProductDetail')!;
  set productDetail(String value) => setField<String>('ProductDetail', value);

  int get companyID => getField<int>('CompanyID')!;
  set companyID(int value) => setField<int>('CompanyID', value);
}
