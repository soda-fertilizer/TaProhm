// Automatic FlutterFlow imports
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
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future downloadImage(
  String? imageUrl,
  String? imageName,
) async {
  // Add your function code here!
  try {
    var response = await http.get(Uri.parse(imageUrl!));

    // Get the application directory
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    // Create a file in the application directory
    File file = File('$appDocPath/$imageName');

    // Write the file
    await file.writeAsBytes(response.bodyBytes);

    // // Load the image
    // Image image = Image.file(file);

    // return image;
  } catch (error) {
    print('Error downloading and writing image: $error');
    throw error;
  }
}
