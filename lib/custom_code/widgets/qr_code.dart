// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatefulWidget {
  const QrCode({
    Key? key,
    this.width,
    this.height,
    required this.qrData,
    required this.qrSize,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String qrData;
  final double qrSize;

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: widget.qrData,
      version: QrVersions.auto,
      size: widget.qrSize,
    );
    ;
  }
}
