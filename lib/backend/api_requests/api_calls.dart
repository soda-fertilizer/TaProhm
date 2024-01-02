import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Users Group Code

class UsersGroup {
  static String baseUrl =
      'https://kwlydfajqnlgqirgtgze.supabase.co/rest/v1/rpc';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
  };
  static LoginCall loginCall = LoginCall();
  static CheckReferralCall checkReferralCall = CheckReferralCall();
  static CheckPhoneNumberCall checkPhoneNumberCall = CheckPhoneNumberCall();
  static OneUserNameCall oneUserNameCall = OneUserNameCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
    String? password = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${UsersGroup.baseUrl}/user_login_auth',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'phone_number': phoneNumber,
        'password': password,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? userID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].userid''',
      ));
  String? phoneNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].phonenumber''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].token''',
      ));
  int? sectorID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].sectorid''',
      ));
  String? sectorName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].sectorname''',
      ));
  String? profile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].profile''',
      ));
  String? userReferral(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].userreferral''',
      ));
  bool? isAdmin(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].isadmin''',
      ));
  String? fullName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].fullname''',
      ));
  String? hashedPassword(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].hashedpassword''',
      ));
  bool? isMember(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].ismember''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  bool? isTestAccount(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].istestaccount''',
      ));
  dynamic invite(dynamic response) => getJsonField(
        response,
        r'''$[:].invite''',
      );
  bool? isSubAdmin(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].issubadmin''',
      ));
}

class CheckReferralCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Check referral',
      apiUrl: '${UsersGroup.baseUrl}/check_referral',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'phone_number': phoneNumber,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckPhoneNumberCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Check phone number',
      apiUrl: '${UsersGroup.baseUrl}/check_phone_number',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'phone_number': phoneNumber,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class OneUserNameCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'one user name',
      apiUrl: '${UsersGroup.baseUrl}/one_user_name',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'phone_number': phoneNumber,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:]''',
      ));
}

/// End Users Group Code

/// Start Company Group Code

class CompanyGroup {
  static String baseUrl =
      'https://kwlydfajqnlgqirgtgze.supabase.co/rest/v1/rpc';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
  };
  static CompanyLocationCall companyLocationCall = CompanyLocationCall();
  static SearchCompanyCall searchCompanyCall = SearchCompanyCall();
}

class CompanyLocationCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Company Location',
      apiUrl: '${CompanyGroup.baseUrl}/company_location',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? companyID(dynamic response) => getJsonField(
        response,
        r'''$[:].companyid''',
        true,
      ) as List?;
  List? latitude(dynamic response) => getJsonField(
        response,
        r'''$[:].latitude''',
        true,
      ) as List?;
  List? longitude(dynamic response) => getJsonField(
        response,
        r'''$[:].longitude''',
        true,
      ) as List?;
}

class SearchCompanyCall {
  Future<ApiCallResponse> call({
    String? companyName = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search company',
      apiUrl: '${CompanyGroup.baseUrl}/search_company',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'company_name': companyName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? companyID(dynamic response) => getJsonField(
        response,
        r'''$[:].CompanyID''',
        true,
      ) as List?;
  List? userID(dynamic response) => getJsonField(
        response,
        r'''$[:].UserID''',
        true,
      ) as List?;
  List? companyName(dynamic response) => getJsonField(
        response,
        r'''$[:].CompanyName''',
        true,
      ) as List?;
  List? companyProfile(dynamic response) => getJsonField(
        response,
        r'''$[:].CompanyProfile''',
        true,
      ) as List?;
  List? companyImages(dynamic response) => getJsonField(
        response,
        r'''$[:].CompanyImages''',
        true,
      ) as List?;
  List? phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$[:].PhoneNumber''',
        true,
      ) as List?;
  List? telegramUrl(dynamic response) => getJsonField(
        response,
        r'''$[:].TelegramUrl''',
        true,
      ) as List?;
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$[:].Detail''',
        true,
      ) as List?;
  List? latitude(dynamic response) => getJsonField(
        response,
        r'''$[:].Latitude''',
        true,
      ) as List?;
  List? longitude(dynamic response) => getJsonField(
        response,
        r'''$[:].Longitude''',
        true,
      ) as List?;
  List? paymentImage(dynamic response) => getJsonField(
        response,
        r'''$[:].PaymentImage''',
        true,
      ) as List?;
  List? isApprove(dynamic response) => getJsonField(
        response,
        r'''$[:].IsApprove''',
        true,
      ) as List?;
  List? isVertify(dynamic response) => getJsonField(
        response,
        r'''$[:].IsVertify''',
        true,
      ) as List?;
  List? isActive(dynamic response) => getJsonField(
        response,
        r'''$[:].IsActive''',
        true,
      ) as List?;
  List? createdDate(dynamic response) => getJsonField(
        response,
        r'''$[:].CreatedDate''',
        true,
      ) as List?;
  List? discount(dynamic response) => getJsonField(
        response,
        r'''$[:].Discount''',
        true,
      ) as List?;
}

/// End Company Group Code

/// Start Transactions Group Code

class TransactionsGroup {
  static String baseUrl =
      'https://kwlydfajqnlgqirgtgze.supabase.co/rest/v1/rpc';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
  };
  static ListTransactionsCall listTransactionsCall = ListTransactionsCall();
  static ListHistoryTransactionsCall listHistoryTransactionsCall =
      ListHistoryTransactionsCall();
  static UserListTransactionsCall userListTransactionsCall =
      UserListTransactionsCall();
  static UserListTransactionsNoDateCall userListTransactionsNoDateCall =
      UserListTransactionsNoDateCall();
}

class ListTransactionsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'List transactions',
      apiUrl: '${TransactionsGroup.baseUrl}/list_transactions',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? transactionID(dynamic response) => (getJsonField(
        response,
        r'''$[:].transactionid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? userName(dynamic response) => (getJsonField(
        response,
        r'''$[:].username''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userProfile(dynamic response) => (getJsonField(
        response,
        r'''$[:].userprofile''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? amount(dynamic response) => (getJsonField(
        response,
        r'''$[:].amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? all(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  List<int>? userID(dynamic response) => (getJsonField(
        response,
        r'''$[:].userid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  String? phoneNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].phonenumber''',
      ));
}

class ListHistoryTransactionsCall {
  Future<ApiCallResponse> call({
    String? fromDate = '',
    String? toDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'List history transactions',
      apiUrl: '${TransactionsGroup.baseUrl}/list_history_transactions',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'from_date': fromDate,
        'to_date': toDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? transactionID(dynamic response) => (getJsonField(
        response,
        r'''$[:].transactionid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? userName(dynamic response) => (getJsonField(
        response,
        r'''$[:].username''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userProfile(dynamic response) => (getJsonField(
        response,
        r'''$[:].userprofile''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? amount(dynamic response) => (getJsonField(
        response,
        r'''$[:].amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? all(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  List<int>? userID(dynamic response) => (getJsonField(
        response,
        r'''$[:].userid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? detail(dynamic response) => (getJsonField(
        response,
        r'''$[:].detail''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? createdDate(dynamic response) => getJsonField(
        response,
        r'''$[:].createddate''',
        true,
      ) as List?;
}

class UserListTransactionsCall {
  Future<ApiCallResponse> call({
    String? fromDate = '',
    String? toDate = '',
    String? userPhoneNumber = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'User list transactions',
      apiUrl: '${TransactionsGroup.baseUrl}/user_list_transactions',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'from_date': fromDate,
        'to_date': toDate,
        'user_phone_number': userPhoneNumber,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? transactionID(dynamic response) => (getJsonField(
        response,
        r'''$[:].transactionid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdDate(dynamic response) => (getJsonField(
        response,
        r'''$[:].createddate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? amount(dynamic response) => (getJsonField(
        response,
        r'''$[:].amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? all(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  List? isApprove(dynamic response) => getJsonField(
        response,
        r'''$[:].isapprove''',
        true,
      ) as List?;
}

class UserListTransactionsNoDateCall {
  Future<ApiCallResponse> call({
    String? userPhoneNumber = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'User list transactions no date',
      apiUrl: '${TransactionsGroup.baseUrl}/user_list_transactions_v2',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'user_phone_number': userPhoneNumber,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? transactionID(dynamic response) => (getJsonField(
        response,
        r'''$[:].transactionid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdDate(dynamic response) => (getJsonField(
        response,
        r'''$[:].createddate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? amount(dynamic response) => (getJsonField(
        response,
        r'''$[:].amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? all(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  List<bool>? isApprove(dynamic response) => (getJsonField(
        response,
        r'''$[:].isapprove''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

/// End Transactions Group Code

/// Start Edge Function Group Code

class EdgeFunctionGroup {
  static String baseUrl =
      'https://kwlydfajqnlgqirgtgze.supabase.co/functions/v1';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
    'Content-Type': 'application/json',
  };
  static UpdateBalanceCall updateBalanceCall = UpdateBalanceCall();
  static ReferralCall referralCall = ReferralCall();
  static GetUserReferralCall getUserReferralCall = GetUserReferralCall();
}

class UpdateBalanceCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
    double? money,
    String? action = 'plus',
  }) async {
    final ffApiRequestBody = '''
{
  "phone_number": "$phoneNumber",
  "money": $money,
  "action": "$action"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Balance',
      apiUrl: '${EdgeFunctionGroup.baseUrl}/UpdateBalance',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ReferralCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
    double? money,
    String? invitePhoneNumber = '',
  }) async {
    final ffApiRequestBody = '''
{
  "phone_number": "$phoneNumber",
  "money": $money,
  "admin": "admin",
  "invite_phone_number": "$invitePhoneNumber"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Referral',
      apiUrl: '${EdgeFunctionGroup.baseUrl}/Referral',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserReferralCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
  }) async {
    final ffApiRequestBody = '''
{
  "phone_number": "$phoneNumber"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get User Referral',
      apiUrl: '${EdgeFunctionGroup.baseUrl}/GetUserReferral',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? userID(dynamic response) => getJsonField(
        response,
        r'''$[:].UserID''',
        true,
      ) as List?;
  List? phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$[:].PhoneNumber''',
        true,
      ) as List?;
  List? password(dynamic response) => getJsonField(
        response,
        r'''$[:].Password''',
        true,
      ) as List?;
  List? token(dynamic response) => getJsonField(
        response,
        r'''$[:].Token''',
        true,
      ) as List?;
  List? isApprove(dynamic response) => getJsonField(
        response,
        r'''$[:].IsApprove''',
        true,
      ) as List?;
  List? paymentImage(dynamic response) => getJsonField(
        response,
        r'''$[:].PaymentImage''',
        true,
      ) as List?;
  List? isActive(dynamic response) => getJsonField(
        response,
        r'''$[:].IsActive''',
        true,
      ) as List?;
  List? balance(dynamic response) => getJsonField(
        response,
        r'''$[:].Balance''',
        true,
      ) as List?;
  List? sectorID(dynamic response) => getJsonField(
        response,
        r'''$[:].SectorID''',
        true,
      ) as List?;
  List? createdDate(dynamic response) => getJsonField(
        response,
        r'''$[:].CreatedDate''',
        true,
      ) as List?;
  List? isAdmin(dynamic response) => getJsonField(
        response,
        r'''$[:].IsAdmin''',
        true,
      ) as List?;
  List? profile(dynamic response) => getJsonField(
        response,
        r'''$[:].Profile''',
        true,
      ) as List?;
  List? fullName(dynamic response) => getJsonField(
        response,
        r'''$[:].FullName''',
        true,
      ) as List?;
  List? userReferral(dynamic response) => getJsonField(
        response,
        r'''$[:].UserReferral''',
        true,
      ) as List?;
  List? isSectorHead(dynamic response) => getJsonField(
        response,
        r'''$[:].IsSectorHead''',
        true,
      ) as List?;
  List? isMember(dynamic response) => getJsonField(
        response,
        r'''$[:].IsMember''',
        true,
      ) as List?;
}

/// End Edge Function Group Code

/// Start Check Group Code

class CheckGroup {
  static String baseUrl =
      'https://kwlydfajqnlgqirgtgze.supabase.co/rest/v1/rpc';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
    'Content-Type': 'application/json',
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
  };
  static CheckMaintenanceModeCall checkMaintenanceModeCall =
      CheckMaintenanceModeCall();
  static AppVersionCall appVersionCall = AppVersionCall();
  static CheckUsablePhoneNumberCall checkUsablePhoneNumberCall =
      CheckUsablePhoneNumberCall();
}

class CheckMaintenanceModeCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Check Maintenance mode',
      apiUrl: '${CheckGroup.baseUrl}/under_maintenance',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic value(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class AppVersionCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'AppVersion',
      apiUrl: '${CheckGroup.baseUrl}/app_version',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? value(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$''',
      ));
}

class CheckUsablePhoneNumberCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'check usable phone number',
      apiUrl: '${CheckGroup.baseUrl}/check_phone_number',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'phone_number': phoneNumber,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? value(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$''',
      ));
}

/// End Check Group Code

class GetMaxPhoneNumberCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get max phone number',
      apiUrl:
          'https://kwlydfajqnlgqirgtgze.supabase.co/rest/v1/rpc/max_phone_number',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? value(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
