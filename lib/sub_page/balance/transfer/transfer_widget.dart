import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'transfer_model.dart';
export 'transfer_model.dart';

class TransferWidget extends StatefulWidget {
  const TransferWidget({
    super.key,
    this.qrCode,
    this.amount,
  });

  final String? qrCode;
  final double? amount;

  @override
  State<TransferWidget> createState() => _TransferWidgetState();
}

class _TransferWidgetState extends State<TransferWidget> {
  late TransferModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransferModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(cameraPermission);
    });

    _model.phoneNumberController ??= TextEditingController(text: widget.qrCode);
    _model.phoneNumberFocusNode ??= FocusNode();

    _model.amountController ??=
        TextEditingController(text: widget.amount?.toString());
    _model.amountFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return FutureBuilder<List<UsersRow>>(
      future: UsersTable().querySingleRow(
        queryFn: (q) => q.eq(
          'UserID',
          FFAppState().UserInfo.userID,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRow> transferUsersRowList = snapshot.data!;
        final transferUsersRow =
            transferUsersRowList.isNotEmpty ? transferUsersRowList.first : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  'Transfer',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Balance: ${formatNumber(
                      transferUsersRow?.balance,
                      formatType: FormatType.decimal,
                      decimalType: DecimalType.automatic,
                    )} USD',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          controller: _model.phoneNumberController,
                          focusNode: _model.phoneNumberFocusNode,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'ID',
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: _model.phoneNumberControllerValidator
                              .asValidator(context),
                        ),
                        TextFormField(
                          controller: _model.amountController,
                          focusNode: _model.amountFocusNode,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Amount',
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.number,
                          validator: _model.amountControllerValidator
                              .asValidator(context),
                        ),
                      ].divide(const SizedBox(height: 10.0)),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          _model.scanner =
                              await FlutterBarcodeScanner.scanBarcode(
                            '#C62828', // scanning line color
                            'Cancel', // cancel button text
                            true, // whether to show the flash icon
                            ScanMode.QR,
                          );

                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'Transfer',
                            queryParameters: {
                              'qrCode': serializeParam(
                                _model.scanner,
                                ParamType.String,
                              ),
                              'amount': serializeParam(
                                double.tryParse(_model.amountController.text),
                                ParamType.double,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          setState(() {});
                        },
                        text: 'Qr code',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          var shouldSetState = false;
                          if (transferUsersRow!.balance >
                              double.parse(_model.amountController.text)) {
                            if (_model.amountController.text != '') {
                              _model.responseUserName =
                                  await UsersGroup.oneUserNameCall.call(
                                phoneNumber: _model.phoneNumberController.text,
                              );
                              shouldSetState = true;
                              if ((_model.responseUserName?.succeeded ??
                                  true)) {
                                // Insert own history
                                _model.ownTransfer =
                                    await TransactionsTable().insert({
                                  'TypeID': 3,
                                  'Amount': double.tryParse(
                                      _model.amountController.text),
                                  'IsApprove': true,
                                  'UserPhoneNumber':
                                      FFAppState().UserInfo.phoneNumber,
                                  'TransferToUserPhoneNumber':
                                      _model.phoneNumberController.text,
                                  'Detail':
                                      'To: ${UsersGroup.oneUserNameCall.name(
                                    (_model.responseUserName?.jsonBody ?? ''),
                                  )}',
                                });
                                shouldSetState = true;
                                // Minus money own balance
                                unawaited(
                                  () async {
                                    _model.apiResult37s =
                                        await EdgeFunctionGroup
                                            .updateBalanceCall
                                            .call(
                                      phoneNumber:
                                          FFAppState().UserInfo.phoneNumber,
                                      money: double.tryParse(
                                          _model.amountController.text),
                                      action: 'minus',
                                    );
                                  }(),
                                );
                                shouldSetState = true;
                                // Minus money other balance
                                unawaited(
                                  () async {
                                    _model.apiResult23456 =
                                        await EdgeFunctionGroup
                                            .updateBalanceCall
                                            .call(
                                      phoneNumber:
                                          _model.phoneNumberController.text,
                                      money: double.tryParse(
                                          _model.amountController.text),
                                      action: 'plus',
                                    );
                                  }(),
                                );
                                shouldSetState = true;
                                // Insert other history
                                _model.userTranfer =
                                    await TransactionsTable().insert({
                                  'TypeID': 7,
                                  'Amount': double.tryParse(
                                      _model.amountController.text),
                                  'IsApprove': true,
                                  'UserPhoneNumber':
                                      _model.phoneNumberController.text,
                                  'TransferToUserPhoneNumber':
                                      FFAppState().UserInfo.phoneNumber,
                                  'Detail':
                                      'From: ${FFAppState().UserInfo.fullName}',
                                });
                                shouldSetState = true;
                                // Log
                                unawaited(
                                  () async {
                                    await LogsTable().insert({
                                      'Details':
                                          'Transfer from: ${FFAppState().UserInfo.fullName}  ID: ${FFAppState().UserInfo.phoneNumber}, To: ${UsersGroup.oneUserNameCall.name(
                                        (_model.responseUserName?.jsonBody ??
                                            ''),
                                      )} ID: ${_model.phoneNumberController.text}, Transfer ID: ${_model.ownTransfer?.transactionID.toString()} Receive ID: ${_model.userTranfer?.transactionID.toString()}',
                                      'Title': 'Tranfer Money',
                                    });
                                  }(),
                                );
                                context.safePop();
                                if (shouldSetState) setState(() {});
                                return;
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('User not found!'),
                                      content: const Text(
                                          'Please check ID and try again.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (shouldSetState) setState(() {});
                                return;
                              }
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Amount can\'t be emty!'),
                                    content: const Text(
                                        'Please input amount of money to tranfer.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              if (shouldSetState) setState(() {});
                              return;
                            }
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Insufficient Balance!'),
                                  content: const Text(
                                      'User don\'t have enough money to Transfer.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (shouldSetState) setState(() {});
                            return;
                          }

                          if (shouldSetState) setState(() {});
                        },
                        text: 'Confirm',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ],
                  ),
                ].divide(const SizedBox(height: 20.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
