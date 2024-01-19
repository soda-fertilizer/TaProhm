import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
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
    secureStorage = const FlutterSecureStorage();
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
    const LatLng(11.5563738, 104.9282099),
    const LatLng(13.330266, 104.1001326),
    const LatLng(13.576473, 105.9699878)
  ];
  List<LatLng> get testLocation => _testLocation;
  set testLocation(List<LatLng> value) {
    _testLocation = value;
  }

  void addToTestLocation(LatLng value) {
    _testLocation.add(value);
  }

  void removeFromTestLocation(LatLng value) {
    _testLocation.remove(value);
  }

  void removeAtIndexFromTestLocation(int index) {
    _testLocation.removeAt(index);
  }

  void updateTestLocationAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    _testLocation[index] = updateFn(_testLocation[index]);
  }

  void insertAtIndexInTestLocation(int index, LatLng value) {
    _testLocation.insert(index, value);
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
  set Letters(List<String> value) {
    _Letters = value;
  }

  void addToLetters(String value) {
    _Letters.add(value);
  }

  void removeFromLetters(String value) {
    _Letters.remove(value);
  }

  void removeAtIndexFromLetters(int index) {
    _Letters.removeAt(index);
  }

  void updateLettersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _Letters[index] = updateFn(_Letters[index]);
  }

  void insertAtIndexInLetters(int index, String value) {
    _Letters.insert(index, value);
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
  set name(List<String> value) {
    _name = value;
  }

  void addToName(String value) {
    _name.add(value);
  }

  void removeFromName(String value) {
    _name.remove(value);
  }

  void removeAtIndexFromName(int index) {
    _name.removeAt(index);
  }

  void updateNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _name[index] = updateFn(_name[index]);
  }

  void insertAtIndexInName(int index, String value) {
    _name.insert(index, value);
  }

  List<String> _SelectCompanyImage = [
    'https://images.pexels.com/photos/18820159/pexels-photo-18820159/free-photo-of-winter-mountain.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/12360591/pexels-photo-12360591.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/18906748/pexels-photo-18906748/free-photo-of-lightning-on-earth.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/19010243/pexels-photo-19010243/free-photo-of-mount-fuji-in-the-distance-with-a-blue-sky.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/19010243/pexels-photo-19010243/free-photo-of-mount-fuji-in-the-distance-with-a-blue-sky.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
  ];
  List<String> get SelectCompanyImage => _SelectCompanyImage;
  set SelectCompanyImage(List<String> value) {
    _SelectCompanyImage = value;
  }

  void addToSelectCompanyImage(String value) {
    _SelectCompanyImage.add(value);
  }

  void removeFromSelectCompanyImage(String value) {
    _SelectCompanyImage.remove(value);
  }

  void removeAtIndexFromSelectCompanyImage(int index) {
    _SelectCompanyImage.removeAt(index);
  }

  void updateSelectCompanyImageAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _SelectCompanyImage[index] = updateFn(_SelectCompanyImage[index]);
  }

  void insertAtIndexInSelectCompanyImage(int index, String value) {
    _SelectCompanyImage.insert(index, value);
  }

  bool _IsLogged = false;
  bool get IsLogged => _IsLogged;
  set IsLogged(bool value) {
    _IsLogged = value;
    secureStorage.setBool('ff_IsLogged', value);
  }

  void deleteIsLogged() {
    secureStorage.delete(key: 'ff_IsLogged');
  }

  List<String> _AdminCompanyImage = [];
  List<String> get AdminCompanyImage => _AdminCompanyImage;
  set AdminCompanyImage(List<String> value) {
    _AdminCompanyImage = value;
  }

  void addToAdminCompanyImage(String value) {
    _AdminCompanyImage.add(value);
  }

  void removeFromAdminCompanyImage(String value) {
    _AdminCompanyImage.remove(value);
  }

  void removeAtIndexFromAdminCompanyImage(int index) {
    _AdminCompanyImage.removeAt(index);
  }

  void updateAdminCompanyImageAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _AdminCompanyImage[index] = updateFn(_AdminCompanyImage[index]);
  }

  void insertAtIndexInAdminCompanyImage(int index, String value) {
    _AdminCompanyImage.insert(index, value);
  }

  UserCreationStruct _CreatAccountHolder =
      UserCreationStruct.fromSerializableMap(jsonDecode(
          '{"Profile":"https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png"}'));
  UserCreationStruct get CreatAccountHolder => _CreatAccountHolder;
  set CreatAccountHolder(UserCreationStruct value) {
    _CreatAccountHolder = value;
    secureStorage.setString('ff_CreatAccountHolder', value.serialize());
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
          '{"Profile":"https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png","ImageDetails":"[]","IsVertify":"false"}'));
  CompanyCreationStruct get CreateCompanyHolder => _CreateCompanyHolder;
  set CreateCompanyHolder(CompanyCreationStruct value) {
    _CreateCompanyHolder = value;
    secureStorage.setString('ff_CreateCompanyHolder', value.serialize());
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
        '{"UserID":"1","Location":"11.5563738,104.9282099"}')),
    LocationStruct.fromSerializableMap(jsonDecode(
        '{"UserID":"2","Location":"12.0982918,105.3131185"}')),
    LocationStruct.fromSerializableMap(jsonDecode(
        '{"UserID":"3","Location":"11.5103727,104.7514569"}'))
  ];
  List<LocationStruct> get testUserLocation => _testUserLocation;
  set testUserLocation(List<LocationStruct> value) {
    _testUserLocation = value;
  }

  void addToTestUserLocation(LocationStruct value) {
    _testUserLocation.add(value);
  }

  void removeFromTestUserLocation(LocationStruct value) {
    _testUserLocation.remove(value);
  }

  void removeAtIndexFromTestUserLocation(int index) {
    _testUserLocation.removeAt(index);
  }

  void updateTestUserLocationAtIndex(
    int index,
    LocationStruct Function(LocationStruct) updateFn,
  ) {
    _testUserLocation[index] = updateFn(_testUserLocation[index]);
  }

  void insertAtIndexInTestUserLocation(int index, LocationStruct value) {
    _testUserLocation.insert(index, value);
  }

  CustomMapLocationStruct _shopHolder = CustomMapLocationStruct();
  CustomMapLocationStruct get shopHolder => _shopHolder;
  set shopHolder(CustomMapLocationStruct value) {
    _shopHolder = value;
  }

  void updateShopHolderStruct(Function(CustomMapLocationStruct) updateFn) {
    updateFn(_shopHolder);
  }

  String _GrapTreeSelectUserPhoneNumber = '';
  String get GrapTreeSelectUserPhoneNumber => _GrapTreeSelectUserPhoneNumber;
  set GrapTreeSelectUserPhoneNumber(String value) {
    _GrapTreeSelectUserPhoneNumber = value;
  }

  UserInfoStruct _UserInfo = UserInfoStruct.fromSerializableMap(
      jsonDecode('{"IsTestAccount":"false"}'));
  UserInfoStruct get UserInfo => _UserInfo;
  set UserInfo(UserInfoStruct value) {
    _UserInfo = value;
    secureStorage.setString('ff_UserInfo', value.serialize());
  }

  void deleteUserInfo() {
    secureStorage.delete(key: 'ff_UserInfo');
  }

  void updateUserInfoStruct(Function(UserInfoStruct) updateFn) {
    updateFn(_UserInfo);
    secureStorage.setString('ff_UserInfo', _UserInfo.serialize());
  }

  List<LocationButtonStruct> _ProvinceButton = [
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"រាជនីភ្នំពេញ","location":"11.543806398027,104.822496883571"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តកំពត","location":"10.5945236,104.1614987"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តកណ្តាល","location":"11.4565296,104.9047875"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តពោធិ៍សាត់","location":"12.4859817,103.9122534"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តរតនគិរី","location":"13.6887625,107.001551"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តបាត់ដំបង","location":"13.097243,103.1609987"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តកំពង់ចាម","location":"12.0583955,105.2460407"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តសៀមរាប","location":"13.4032174,103.8346537"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តកំពង់ឆ្នាំង","location":"12.2530842,104.6684802"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តស្ទឹងត្រែង","location":"13.5164491,105.9635813"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តកែប","location":"10.5366344,104.3047087"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តស្វាយរៀង","location":"11.0879008,105.7910697"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តតាកែវ","location":"10.9852956,104.7809697"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តត្បូងឃ្មុំ","location":"11.9149092,105.6547726"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តកំពង់ស្ពឺ","location":"11.4333537,104.2730332"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តបន្ទាយមានជ័យ","location":"13.5858712,102.960583"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តកំពង់ធំ","location":"12.6472479,104.9227638"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តឧត្ដរមានជ័យ","location":"14.2443481,103.5721055"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តព្រះវិហារ","location":"13.755592,104.9718959"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តប៉ៃលិន","location":"12.8510294,102.608646"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តមណ្ឌលគិរី","location":"12.4687725,107.1901973"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តក្រចេះ","location":"12.4944187,106.0247805"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តកោះកុង","location":"11.6836627,103.3696454"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តព្រះសីហនុ","location":"10.6265384,103.5116496"}')),
    LocationButtonStruct.fromSerializableMap(jsonDecode(
        '{"province":"ខេត្តព្រៃវែង","location":"11.4849954,105.3220705"}'))
  ];
  List<LocationButtonStruct> get ProvinceButton => _ProvinceButton;
  set ProvinceButton(List<LocationButtonStruct> value) {
    _ProvinceButton = value;
  }

  void addToProvinceButton(LocationButtonStruct value) {
    _ProvinceButton.add(value);
  }

  void removeFromProvinceButton(LocationButtonStruct value) {
    _ProvinceButton.remove(value);
  }

  void removeAtIndexFromProvinceButton(int index) {
    _ProvinceButton.removeAt(index);
  }

  void updateProvinceButtonAtIndex(
    int index,
    LocationButtonStruct Function(LocationButtonStruct) updateFn,
  ) {
    _ProvinceButton[index] = updateFn(_ProvinceButton[index]);
  }

  void insertAtIndexInProvinceButton(int index, LocationButtonStruct value) {
    _ProvinceButton.insert(index, value);
  }

  String _refreshFCMToken = '';
  String get refreshFCMToken => _refreshFCMToken;
  set refreshFCMToken(String value) {
    _refreshFCMToken = value;
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
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
