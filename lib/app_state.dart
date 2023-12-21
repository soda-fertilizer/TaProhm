import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _IsLogged = await secureStorage.getBool('ff_IsLogged') ?? _IsLogged;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_CreatAccountHolder') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_CreatAccountHolder') ?? '{}';
          _CreatAccountHolder = UserCreationStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_CreateCompanyHolder') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_CreateCompanyHolder') ?? '{}';
          _CreateCompanyHolder = CompanyCreationStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_UserInfo') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_UserInfo') ?? '{}';
          _UserInfo =
              UserInfoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<LatLng> _testLocation = [
    LatLng(11.5563738, 104.9282099),
    LatLng(13.330266, 104.1001326),
    LatLng(13.576473, 105.9699878)
  ];
  List<LatLng> get testLocation => _testLocation;
  set testLocation(List<LatLng> _value) {
    _testLocation = _value;
  }

  void addToTestLocation(LatLng _value) {
    _testLocation.add(_value);
  }

  void removeFromTestLocation(LatLng _value) {
    _testLocation.remove(_value);
  }

  void removeAtIndexFromTestLocation(int _index) {
    _testLocation.removeAt(_index);
  }

  void updateTestLocationAtIndex(
    int _index,
    LatLng Function(LatLng) updateFn,
  ) {
    _testLocation[_index] = updateFn(_testLocation[_index]);
  }

  void insertAtIndexInTestLocation(int _index, LatLng _value) {
    _testLocation.insert(_index, _value);
  }

  List<String> _Letters = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    'other'
  ];
  List<String> get Letters => _Letters;
  set Letters(List<String> _value) {
    _Letters = _value;
  }

  void addToLetters(String _value) {
    _Letters.add(_value);
  }

  void removeFromLetters(String _value) {
    _Letters.remove(_value);
  }

  void removeAtIndexFromLetters(int _index) {
    _Letters.removeAt(_index);
  }

  void updateLettersAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _Letters[_index] = updateFn(_Letters[_index]);
  }

  void insertAtIndexInLetters(int _index, String _value) {
    _Letters.insert(_index, _value);
  }

  List<String> _name = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eve',
    'Frank',
    'Grace',
    'Hannah',
    'សុខា'
  ];
  List<String> get name => _name;
  set name(List<String> _value) {
    _name = _value;
  }

  void addToName(String _value) {
    _name.add(_value);
  }

  void removeFromName(String _value) {
    _name.remove(_value);
  }

  void removeAtIndexFromName(int _index) {
    _name.removeAt(_index);
  }

  void updateNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _name[_index] = updateFn(_name[_index]);
  }

  void insertAtIndexInName(int _index, String _value) {
    _name.insert(_index, _value);
  }

  List<String> _SelectCompanyImage = [
    'https://images.pexels.com/photos/18820159/pexels-photo-18820159/free-photo-of-winter-mountain.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/12360591/pexels-photo-12360591.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/18906748/pexels-photo-18906748/free-photo-of-lightning-on-earth.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/19010243/pexels-photo-19010243/free-photo-of-mount-fuji-in-the-distance-with-a-blue-sky.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/19010243/pexels-photo-19010243/free-photo-of-mount-fuji-in-the-distance-with-a-blue-sky.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
  ];
  List<String> get SelectCompanyImage => _SelectCompanyImage;
  set SelectCompanyImage(List<String> _value) {
    _SelectCompanyImage = _value;
  }

  void addToSelectCompanyImage(String _value) {
    _SelectCompanyImage.add(_value);
  }

  void removeFromSelectCompanyImage(String _value) {
    _SelectCompanyImage.remove(_value);
  }

  void removeAtIndexFromSelectCompanyImage(int _index) {
    _SelectCompanyImage.removeAt(_index);
  }

  void updateSelectCompanyImageAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _SelectCompanyImage[_index] = updateFn(_SelectCompanyImage[_index]);
  }

  void insertAtIndexInSelectCompanyImage(int _index, String _value) {
    _SelectCompanyImage.insert(_index, _value);
  }

  bool _IsLogged = false;
  bool get IsLogged => _IsLogged;
  set IsLogged(bool _value) {
    _IsLogged = _value;
    secureStorage.setBool('ff_IsLogged', _value);
  }

  void deleteIsLogged() {
    secureStorage.delete(key: 'ff_IsLogged');
  }

  List<String> _AdminCompanyImage = [];
  List<String> get AdminCompanyImage => _AdminCompanyImage;
  set AdminCompanyImage(List<String> _value) {
    _AdminCompanyImage = _value;
  }

  void addToAdminCompanyImage(String _value) {
    _AdminCompanyImage.add(_value);
  }

  void removeFromAdminCompanyImage(String _value) {
    _AdminCompanyImage.remove(_value);
  }

  void removeAtIndexFromAdminCompanyImage(int _index) {
    _AdminCompanyImage.removeAt(_index);
  }

  void updateAdminCompanyImageAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _AdminCompanyImage[_index] = updateFn(_AdminCompanyImage[_index]);
  }

  void insertAtIndexInAdminCompanyImage(int _index, String _value) {
    _AdminCompanyImage.insert(_index, _value);
  }

  UserCreationStruct _CreatAccountHolder =
      UserCreationStruct.fromSerializableMap(jsonDecode(
          '{\"Profile\":\"https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png\"}'));
  UserCreationStruct get CreatAccountHolder => _CreatAccountHolder;
  set CreatAccountHolder(UserCreationStruct _value) {
    _CreatAccountHolder = _value;
    secureStorage.setString('ff_CreatAccountHolder', _value.serialize());
  }

  void deleteCreatAccountHolder() {
    secureStorage.delete(key: 'ff_CreatAccountHolder');
  }

  void updateCreatAccountHolderStruct(Function(UserCreationStruct) updateFn) {
    updateFn(_CreatAccountHolder);
    secureStorage.setString(
        'ff_CreatAccountHolder', _CreatAccountHolder.serialize());
  }

  CompanyCreationStruct _CreateCompanyHolder =
      CompanyCreationStruct.fromSerializableMap(jsonDecode(
          '{\"Profile\":\"https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png\",\"ImageDetails\":\"[]\",\"IsVertify\":\"false\"}'));
  CompanyCreationStruct get CreateCompanyHolder => _CreateCompanyHolder;
  set CreateCompanyHolder(CompanyCreationStruct _value) {
    _CreateCompanyHolder = _value;
    secureStorage.setString('ff_CreateCompanyHolder', _value.serialize());
  }

  void deleteCreateCompanyHolder() {
    secureStorage.delete(key: 'ff_CreateCompanyHolder');
  }

  void updateCreateCompanyHolderStruct(
      Function(CompanyCreationStruct) updateFn) {
    updateFn(_CreateCompanyHolder);
    secureStorage.setString(
        'ff_CreateCompanyHolder', _CreateCompanyHolder.serialize());
  }

  List<LocationStruct> _testUserLocation = [
    LocationStruct.fromSerializableMap(jsonDecode(
        '{\"UserID\":\"1\",\"Location\":\"11.5563738,104.9282099\"}')),
    LocationStruct.fromSerializableMap(jsonDecode(
        '{\"UserID\":\"2\",\"Location\":\"12.0982918,105.3131185\"}')),
    LocationStruct.fromSerializableMap(jsonDecode(
        '{\"UserID\":\"3\",\"Location\":\"11.5103727,104.7514569\"}'))
  ];
  List<LocationStruct> get testUserLocation => _testUserLocation;
  set testUserLocation(List<LocationStruct> _value) {
    _testUserLocation = _value;
  }

  void addToTestUserLocation(LocationStruct _value) {
    _testUserLocation.add(_value);
  }

  void removeFromTestUserLocation(LocationStruct _value) {
    _testUserLocation.remove(_value);
  }

  void removeAtIndexFromTestUserLocation(int _index) {
    _testUserLocation.removeAt(_index);
  }

  void updateTestUserLocationAtIndex(
    int _index,
    LocationStruct Function(LocationStruct) updateFn,
  ) {
    _testUserLocation[_index] = updateFn(_testUserLocation[_index]);
  }

  void insertAtIndexInTestUserLocation(int _index, LocationStruct _value) {
    _testUserLocation.insert(_index, _value);
  }

  CustomMapLocationStruct _shopHolder = CustomMapLocationStruct();
  CustomMapLocationStruct get shopHolder => _shopHolder;
  set shopHolder(CustomMapLocationStruct _value) {
    _shopHolder = _value;
  }

  void updateShopHolderStruct(Function(CustomMapLocationStruct) updateFn) {
    updateFn(_shopHolder);
  }

  UserInfoStruct _UserInfo = UserInfoStruct.fromSerializableMap(
      jsonDecode('{\"IsTestAccount\":\"false\"}'));
  UserInfoStruct get UserInfo => _UserInfo;
  set UserInfo(UserInfoStruct _value) {
    _UserInfo = _value;
    secureStorage.setString('ff_UserInfo', _value.serialize());
  }

  void deleteUserInfo() {
    secureStorage.delete(key: 'ff_UserInfo');
  }

  void updateUserInfoStruct(Function(UserInfoStruct) updateFn) {
    updateFn(_UserInfo);
    secureStorage.setString('ff_UserInfo', _UserInfo.serialize());
  }

  final _companyManager = FutureRequestManager<List<CompaniesRow>>();
  Future<List<CompaniesRow>> company({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CompaniesRow>> Function() requestFn,
  }) =>
      _companyManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCompanyCache() => _companyManager.clear();
  void clearCompanyCacheKey(String? uniqueKey) =>
      _companyManager.clearRequest(uniqueKey);

  final _adminRequestAccountManager = FutureRequestManager<List<UsersRow>>();
  Future<List<UsersRow>> adminRequestAccount({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersRow>> Function() requestFn,
  }) =>
      _adminRequestAccountManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAdminRequestAccountCache() => _adminRequestAccountManager.clear();
  void clearAdminRequestAccountCacheKey(String? uniqueKey) =>
      _adminRequestAccountManager.clearRequest(uniqueKey);

  final _userTransactionManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> userTransaction({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _userTransactionManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserTransactionCache() => _userTransactionManager.clear();
  void clearUserTransactionCacheKey(String? uniqueKey) =>
      _userTransactionManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
