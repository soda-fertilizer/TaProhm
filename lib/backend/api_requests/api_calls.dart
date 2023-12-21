import 'dart:convert';
import 'dart:typed_data';

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

  dynamic userID(dynamic response) => getJsonField(
        response,
        r'''$[:].userid''',
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$[:].phonenumber''',
      );
  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$[:].token''',
      );
  dynamic sectorID(dynamic response) => getJsonField(
        response,
        r'''$[:].sectorid''',
      );
  dynamic sectorName(dynamic response) => getJsonField(
        response,
        r'''$[:].sectorname''',
      );
  dynamic profile(dynamic response) => getJsonField(
        response,
        r'''$[:].profile''',
      );
  dynamic userReferral(dynamic response) => getJsonField(
        response,
        r'''$[:].userreferral''',
      );
  dynamic isAdmin(dynamic response) => getJsonField(
        response,
        r'''$[:].isadmin''',
      );
  dynamic fullName(dynamic response) => getJsonField(
        response,
        r'''$[:].fullname''',
      );
  dynamic hashedPassword(dynamic response) => getJsonField(
        response,
        r'''$[:].hashedpassword''',
      );
  dynamic isMember(dynamic response) => getJsonField(
        response,
        r'''$[:].ismember''',
      );
  dynamic errorMessage(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic isTestAccount(dynamic response) => getJsonField(
        response,
        r'''$[:].istestaccount''',
      );
  dynamic invite(dynamic response) => getJsonField(
        response,
        r'''$[:].invite''',
      );
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

  dynamic errorMessage(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
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

  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
      );
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
          .cast<int>();
  List<String>? userName(dynamic response) => (getJsonField(
        response,
        r'''$[:].username''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? userProfile(dynamic response) => (getJsonField(
        response,
        r'''$[:].userprofile''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? amount(dynamic response) => (getJsonField(
        response,
        r'''$[:].amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List? all(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  List? userID(dynamic response) => getJsonField(
        response,
        r'''$[:].userid''',
        true,
      ) as List?;
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
          .cast<int>();
  List<String>? userName(dynamic response) => (getJsonField(
        response,
        r'''$[:].username''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? userProfile(dynamic response) => (getJsonField(
        response,
        r'''$[:].userprofile''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? amount(dynamic response) => (getJsonField(
        response,
        r'''$[:].amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
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
          .cast<int>();
  List<String>? detail(dynamic response) => (getJsonField(
        response,
        r'''$[:].detail''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
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
          .cast<int>();
  List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? createdDate(dynamic response) => (getJsonField(
        response,
        r'''$[:].createddate''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? amount(dynamic response) => (getJsonField(
        response,
        r'''$[:].amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
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
          .cast<int>();
  List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? createdDate(dynamic response) => (getJsonField(
        response,
        r'''$[:].createddate''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? amount(dynamic response) => (getJsonField(
        response,
        r'''$[:].amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
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
          .cast<bool>();
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
  "phone_number": "${phoneNumber}",
  "money": ${money},
  "action": "${action}"
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
  "phone_number": "${phoneNumber}",
  "money": ${money},
  "admin": "admin",
  "invite_phone_number": "${invitePhoneNumber}"
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
  "phone_number": "${phoneNumber}"
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

class CheckUnderMaintenanceCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Check Under Maintenance',
      apiUrl:
          'https://kwlydfajqnlgqirgtgze.supabase.co/rest/v1/rpc/under_maintenance',
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

  static dynamic value(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

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

  static dynamic value(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
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
