// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

Future inAppUpdate(
  String? serverAppVersion,
  Future<dynamic> Function() androidAction,
  Future<dynamic> Function() iosAction,
) async {
  // Add your function code here!
  String appVersion = FFAppConstants.AppVersion;
  List<int> v1 = appVersion.split('.').map((e) => int.parse(e)).toList();
  List<int> v2 = serverAppVersion!.split('.').map((e) => int.parse(e)).toList();

  for (var i = 0; i < v1.length; i++) {
    if (v2[i] > v1[i]) {
      if (Platform.isAndroid) {
        androidAction();
      } else if (Platform.isIOS) {
        iosAction();
      }
    }
  }
}
