import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Users Group Code

class UsersGroup {
  static String getBaseUrl() =>
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
  static SectorPhoneNumberCall sectorPhoneNumberCall = SectorPhoneNumberCall();
  static OneUserNameCall oneUserNameCall = OneUserNameCall();
  static GetNearestDistrictCall getNearestDistrictCall =
      GetNearestDistrictCall();
  static CheckPasswordChangeCall checkPasswordChangeCall =
      CheckPasswordChangeCall();
  static UserAndCompanyCall userAndCompanyCall = UserAndCompanyCall();
  static SearchUserAndCompanyCall searchUserAndCompanyCall =
      SearchUserAndCompanyCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
    String? password = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '$baseUrl/user_login_auth',
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
      isStreamingApi: false,
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
    final baseUrl = UsersGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Check referral',
      apiUrl: '$baseUrl/check_referral',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckPhoneNumberCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Check phone number',
      apiUrl: '$baseUrl/check_phone_number',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SectorPhoneNumberCall {
  Future<ApiCallResponse> call({
    int? sectorId,
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'sector phone number',
      apiUrl: '$baseUrl/sector_phone_number',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'sector_id': sectorId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? phoneNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:]''',
      ));
}

class OneUserNameCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'one user name',
      apiUrl: '$baseUrl/one_user_name',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:]''',
      ));
}

class GetNearestDistrictCall {
  Future<ApiCallResponse> call({
    double? lat,
    double? lon,
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get nearest district',
      apiUrl: '$baseUrl/get_nearest_district',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'lat': lat,
        'lon': lon,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? districtID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].DistrictID''',
      ));
  int? provinceID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].ProvinceID''',
      ));
  double? distance(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$[:].distance''',
      ));
}

class CheckPasswordChangeCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? password = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'check password change',
      apiUrl: '$baseUrl/check_password_change',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'user_id': userId,
        'password': password,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserAndCompanyCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = UsersGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'user and company',
      apiUrl: '$baseUrl/user_and_company',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? fullName(dynamic response) => (getJsonField(
        response,
        r'''$[:].fullname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? phoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].phonenumber''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? userID(dynamic response) => (getJsonField(
        response,
        r'''$[:].userid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$[:].image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? companyCount(dynamic response) => (getJsonField(
        response,
        r'''$[:].companycount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? joinDate(dynamic response) => (getJsonField(
        response,
        r'''$[:].joindate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SearchUserAndCompanyCall {
  Future<ApiCallResponse> call({
    String? pFullname = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'search user and company',
      apiUrl: '$baseUrl/search_user_and_company',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'p_fullname': pFullname,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? fullName(dynamic response) => (getJsonField(
        response,
        r'''$[:].fullname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? phoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].phonenumber''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? userID(dynamic response) => (getJsonField(
        response,
        r'''$[:].userid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$[:].image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? companyCount(dynamic response) => (getJsonField(
        response,
        r'''$[:].companycount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? joinDate(dynamic response) => (getJsonField(
        response,
        r'''$[:].joindate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Users Group Code

/// Start Company Group Code

class CompanyGroup {
  static String getBaseUrl() =>
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
  static CheckRatingCall checkRatingCall = CheckRatingCall();
  static CompanyRatingCall companyRatingCall = CompanyRatingCall();
  static CompayRatingByUserCall compayRatingByUserCall =
      CompayRatingByUserCall();
  static CompayRatingByCompanyCall compayRatingByCompanyCall =
      CompayRatingByCompanyCall();
}

class CompanyLocationCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = CompanyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Company Location',
      apiUrl: '$baseUrl/company_location',
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
      isStreamingApi: false,
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
    final baseUrl = CompanyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Search company',
      apiUrl: '$baseUrl/search_company',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? companyID(dynamic response) => (getJsonField(
        response,
        r'''$[:].CompanyID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? userID(dynamic response) => (getJsonField(
        response,
        r'''$[:].UserID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? companyName(dynamic response) => (getJsonField(
        response,
        r'''$[:].CompanyName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companyProfile(dynamic response) => (getJsonField(
        response,
        r'''$[:].CompanyProfile''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? companyImages(dynamic response) => getJsonField(
        response,
        r'''$[:].CompanyImages''',
        true,
      ) as List?;
  List<String>? phoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].PhoneNumber''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? telegramUrl(dynamic response) => (getJsonField(
        response,
        r'''$[:].TelegramUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? detail(dynamic response) => (getJsonField(
        response,
        r'''$[:].Detail''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<double>? latitude(dynamic response) => (getJsonField(
        response,
        r'''$[:].Latitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? longitude(dynamic response) => (getJsonField(
        response,
        r'''$[:].Longitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<String>? paymentImage(dynamic response) => (getJsonField(
        response,
        r'''$[:].PaymentImage''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? isApprove(dynamic response) => (getJsonField(
        response,
        r'''$[:].IsApprove''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? isVertify(dynamic response) => (getJsonField(
        response,
        r'''$[:].IsVertify''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? isActive(dynamic response) => (getJsonField(
        response,
        r'''$[:].IsActive''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<String>? createdDate(dynamic response) => (getJsonField(
        response,
        r'''$[:].CreatedDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? discount(dynamic response) => (getJsonField(
        response,
        r'''$[:].Discount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class CheckRatingCall {
  Future<ApiCallResponse> call({
    int? userId,
    int? companyId,
  }) async {
    final baseUrl = CompanyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'check rating',
      apiUrl: '$baseUrl/check_rating',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'user_id': userId,
        'company_id': companyId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class CompanyRatingCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = CompanyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'company rating',
      apiUrl: '$baseUrl/company_rating',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? comapnyID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].companyid''',
      ));
  int? rating(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].rating''',
      ));
  int? ratingCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].ratingcount''',
      ));
}

class CompayRatingByUserCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = CompanyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'compay rating by user',
      apiUrl: '$baseUrl/compay_rating_by_user',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? companyName(dynamic response) => (getJsonField(
        response,
        r'''$[:].companyname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companyProfile(dynamic response) => (getJsonField(
        response,
        r'''$[:].companyprofile''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? rating(dynamic response) => (getJsonField(
        response,
        r'''$[:].rating''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? rateID(dynamic response) => (getJsonField(
        response,
        r'''$[:].rateid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class CompayRatingByCompanyCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = CompanyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'compay rating by company',
      apiUrl: '$baseUrl/compay_rating_by_company',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? rating(dynamic response) => (getJsonField(
        response,
        r'''$[:].rating''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? rateID(dynamic response) => (getJsonField(
        response,
        r'''$[:].rateid''',
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
}

/// End Company Group Code

/// Start Transactions Group Code

class TransactionsGroup {
  static String getBaseUrl() =>
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
    final baseUrl = TransactionsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'List transactions',
      apiUrl: '$baseUrl/list_transactions',
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
      isStreamingApi: false,
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
    final baseUrl = TransactionsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'List history transactions',
      apiUrl: '$baseUrl/list_history_transactions',
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
      isStreamingApi: false,
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
    final baseUrl = TransactionsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'User list transactions',
      apiUrl: '$baseUrl/user_list_transactions',
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
      isStreamingApi: false,
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
    final baseUrl = TransactionsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'User list transactions no date',
      apiUrl: '$baseUrl/user_list_transactions_v2',
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
      isStreamingApi: false,
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
  static String getBaseUrl() =>
      'https://kwlydfajqnlgqirgtgze.supabase.co/functions/v1';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw',
    'Content-Type': 'application/json',
  };
  static UpdateBalanceCall updateBalanceCall = UpdateBalanceCall();
  static ReferralCall referralCall = ReferralCall();
  static ReferralSecondCall referralSecondCall = ReferralSecondCall();
  static GetUserReferralCall getUserReferralCall = GetUserReferralCall();
  static PushNotifcationSingleUserCall pushNotifcationSingleUserCall =
      PushNotifcationSingleUserCall();
  static PushNotifcationMultipleUserCall pushNotifcationMultipleUserCall =
      PushNotifcationMultipleUserCall();
  static BroadcastPushNotifcationCall broadcastPushNotifcationCall =
      BroadcastPushNotifcationCall();
  static IncreaseCompanyViewCountCall increaseCompanyViewCountCall =
      IncreaseCompanyViewCountCall();
}

class UpdateBalanceCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
    double? money,
    String? action = 'plus',
  }) async {
    final baseUrl = EdgeFunctionGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "phone_number": "$phoneNumber",
  "money": $money,
  "action": "$action"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Balance',
      apiUrl: '$baseUrl/UpdateBalance',
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
      isStreamingApi: false,
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
    final baseUrl = EdgeFunctionGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "phone_number": "$phoneNumber",
  "money": $money,
  "admin": "admin",
  "invite_phone_number": "$invitePhoneNumber"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Referral',
      apiUrl: '$baseUrl/Referral',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReferralSecondCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
    double? money,
    String? invitePhoneNumber = '',
    String? sector = '',
  }) async {
    final baseUrl = EdgeFunctionGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "phone_number": "$phoneNumber",
  "money": $money,
  "association": "000001",
  "admin": "admin",
  "sector": "$sector",
  "invite_phone_number": "$invitePhoneNumber"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Referral second',
      apiUrl: '$baseUrl/ReferralV2',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserReferralCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
  }) async {
    final baseUrl = EdgeFunctionGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "phone_number": "$phoneNumber"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get User Referral',
      apiUrl: '$baseUrl/GetUserReferral',
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
      isStreamingApi: false,
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

class PushNotifcationSingleUserCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? title = '',
    String? contents = '',
  }) async {
    final baseUrl = EdgeFunctionGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "token": "$token",
  "title": "$title",
  "contents": "$contents"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Push Notifcation Single User',
      apiUrl: '$baseUrl/PushNotifcation',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PushNotifcationMultipleUserCall {
  Future<ApiCallResponse> call({
    List<String>? tokenList,
    String? title = '',
    String? contents = '',
  }) async {
    final baseUrl = EdgeFunctionGroup.getBaseUrl();
    final token = _serializeList(tokenList);

    final ffApiRequestBody = '''
{
  "token": $token,
  "title": "$title",
  "contents": "$contents"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Push Notifcation Multiple User',
      apiUrl: '$baseUrl/PushNotifcation',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BroadcastPushNotifcationCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? contents = '',
  }) async {
    final baseUrl = EdgeFunctionGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "title": "$title",
  "contents": "$contents"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Broadcast Push Notifcation',
      apiUrl: '$baseUrl/BroadcastPushNotifcation',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class IncreaseCompanyViewCountCall {
  Future<ApiCallResponse> call({
    int? companyId,
  }) async {
    final baseUrl = EdgeFunctionGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "company_id": $companyId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Increase Company ViewCount',
      apiUrl: '$baseUrl/IncreaseCompanyViewCount',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Edge Function Group Code

/// Start Check Group Code

class CheckGroup {
  static String getBaseUrl() =>
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
    final baseUrl = CheckGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Check Maintenance mode',
      apiUrl: '$baseUrl/under_maintenance',
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
      isStreamingApi: false,
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
    final baseUrl = CheckGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'AppVersion',
      apiUrl: '$baseUrl/app_version',
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
      isStreamingApi: false,
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
    final baseUrl = CheckGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'check usable phone number',
      apiUrl: '$baseUrl/check_phone_number',
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
