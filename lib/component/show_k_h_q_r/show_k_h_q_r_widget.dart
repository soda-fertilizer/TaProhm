import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'show_k_h_q_r_model.dart';
export 'show_k_h_q_r_model.dart';

class ShowKHQRWidget extends StatefulWidget {
  const ShowKHQRWidget({super.key});

  @override
  State<ShowKHQRWidget> createState() => _ShowKHQRWidgetState();
}

class _ShowKHQRWidgetState extends State<ShowKHQRWidget> {
  late ShowKHQRModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowKHQRModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.storagePermisson();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'KHQR',
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: OctoImage(
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    FFAppConstants.BlurHash,
                  ),
                  image: const CachedNetworkImageProvider(
                    'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/KHQR.jpg',
                  ),
                  width: 300.0,
                  height: 300.0,
                  fit: BoxFit.contain,
                ),
              ),
              if (false)
                FFButtonWidget(
                  onPressed: () async {
                    await actions.downloadImage(
                      'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/KHQR.jpg',
                      'KHQR.jpg',
                    );
                  },
                  text: 'Save',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
            ].divide(const SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
