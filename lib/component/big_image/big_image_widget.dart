import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'big_image_model.dart';
export 'big_image_model.dart';

class BigImageWidget extends StatefulWidget {
  const BigImageWidget({
    Key? key,
    required this.imgURL,
  }) : super(key: key);

  final String? imgURL;

  @override
  _BigImageWidgetState createState() => _BigImageWidgetState();
}

class _BigImageWidgetState extends State<BigImageWidget> {
  late BigImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BigImageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 2.0,
        sigmaY: 2.0,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            fadeInDuration: Duration(milliseconds: 500),
            fadeOutDuration: Duration(milliseconds: 500),
            imageUrl: widget.imgURL!,
            width: double.infinity,
            height: 300.0,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
