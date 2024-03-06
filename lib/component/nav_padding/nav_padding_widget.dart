import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nav_padding_model.dart';
export 'nav_padding_model.dart';

class NavPaddingWidget extends StatefulWidget {
  const NavPaddingWidget({super.key});

  @override
  State<NavPaddingWidget> createState() => _NavPaddingWidgetState();
}

class _NavPaddingWidgetState extends State<NavPaddingWidget> {
  late NavPaddingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavPaddingModel());

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

    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: const BoxDecoration(),
    );
  }
}
