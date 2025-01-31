import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'show_qr_code_model.dart';
export 'show_qr_code_model.dart';

class ShowQrCodeWidget extends StatefulWidget {
  const ShowQrCodeWidget({
    super.key,
    required this.data,
    required this.size,
  });

  final String? data;
  final double? size;

  @override
  State<ShowQrCodeWidget> createState() => _ShowQrCodeWidgetState();
}

class _ShowQrCodeWidgetState extends State<ShowQrCodeWidget> {
  late ShowQrCodeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowQrCodeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: const BoxDecoration(),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: custom_widgets.QrCode(
            width: double.infinity,
            height: double.infinity,
            qrData: widget.data!,
            qrSize: widget.size!,
          ),
        ),
      ),
    );
  }
}
