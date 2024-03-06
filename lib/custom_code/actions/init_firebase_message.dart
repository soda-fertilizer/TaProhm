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

import 'package:firebase_messaging/firebase_messaging.dart';

Future<String?> initFirebaseMessage() async {
  // Add your function code here!

  await FirebaseMessaging.instance.getAPNSToken();
  if (isAndroid || isiOS) {
    await FirebaseMessaging.instance.subscribeToTopic('total-users');
  }
  final String? token = await FirebaseMessaging.instance.getToken();
  return token!;
}
