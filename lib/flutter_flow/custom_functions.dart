import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/custom_auth/auth_util.dart';

DateTime? offSetDay(
  DateTime date,
  int offSet,
) {
  return DateTime(date.year, date.month, date.day + offSet);
}

LatLng? returnLatLng(
  double? latitude,
  double? longitude,
) {
  return LatLng(latitude!, longitude!);
}

List<double>? splitLatLng(LatLng? value) {
  return [value!.latitude, value.longitude];
}

bool? compareLatLng(
  LatLng? value1,
  LatLng? value2,
) {
  // function to compare LatLng
  if (value1 == null || value2 == null) {
    return false;
  }
  final latDiff = (value1.latitude - value2.latitude).abs();
  final lngDiff = (value1.longitude - value2.longitude).abs();
  return latDiff < 0.0001 && lngDiff < 0.0001;
}

DateTime? dataTimeConverter(String? datetime) {
  try {
    return DateTime.parse(datetime!);
  } catch (e) {
    print('Error parsing datetime: $e');
    return DateTime.now();
  }
}

double? areSimilarLocation(
  double? latitude,
  double? targetLatitude,
  double? longitude,
  double? targetLongitude,
) {
  final latDiff = (latitude! - targetLatitude!).abs();
  final lngDiff = (longitude! - targetLongitude!).abs();
  return latDiff + lngDiff;
}

int? calculateDateDifference(
  String dateString1,
  String dateString2,
) {
  try {
    DateTime date1 = DateTime.parse(dateString1);
    DateTime date2 = DateTime.parse(dateString2);

    Duration difference = date1.difference(date2);

    return difference.inDays;
  } catch (e) {
    return null;
  }
}

String? charLimit(
  int? numLimit,
  String? stringValue,
) {
  if (stringValue!.length > numLimit!) {
    return "${stringValue.substring(0, numLimit)}...";
  } else {
    return stringValue;
  }
}

double? jsonToDouble(dynamic number) {
  return double.tryParse(number.toString());
}
