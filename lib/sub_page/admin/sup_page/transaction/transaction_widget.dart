import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'transaction_model.dart';
export 'transaction_model.dart';

class TransactionWidget extends StatefulWidget {
  const TransactionWidget({
    super.key,
    required this.transactionID,
  });

  final int? transactionID;

  @override
  State<TransactionWidget> createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  late TransactionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionModel());

    _model.amountFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<TransactionsRow>>(
      future: TransactionsTable().querySingleRow(
        queryFn: (q) => q.eq(
          'TransactionID',
          widget.transactionID,
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
        List<TransactionsRow> transactionTransactionsRowList = snapshot.data!;
        final transactionTransactionsRow =
            transactionTransactionsRowList.isNotEmpty
                ? transactionTransactionsRowList.first
                : null;
        return Title(
            title: 'Transaction',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
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
                      context.safePop();
                    },
                  ),
                  title: Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      'Transaction',
                      style: FlutterFlowTheme.of(context).titleMedium,
                    ),
                  ),
                  actions: const [],
                  centerTitle: true,
                  elevation: 2.0,
                ),
                body: SafeArea(
                  top: true,
                  child: FutureBuilder<List<UsersRow>>(
                    future: UsersTable().querySingleRow(
                      queryFn: (q) => q.eq(
                        'PhoneNumber',
                        transactionTransactionsRow?.userPhoneNumber,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<UsersRow> containerUsersRowList = snapshot.data!;
                      final containerUsersRow = containerUsersRowList.isNotEmpty
                          ? containerUsersRowList.first
                          : null;
                      return Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (transactionTransactionsRow?.typeID == 1)
                                Text(
                                  'User Balance: ${containerUsersRow?.balance.toString()}',
                                  style: FlutterFlowTheme.of(context).bodyLarge,
                                ),
                              TextFormField(
                                controller: _model.amountController ??=
                                    TextEditingController(
                                  text: transactionTransactionsRow?.amount
                                      .toString(),
                                ),
                                focusNode: _model.amountFocusNode,
                                readOnly: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelText: 'Amont',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                validator: _model.amountControllerValidator
                                    .asValidator(context),
                              ),
                              TextFormField(
                                controller: _model.textController2,
                                focusNode: _model.textFieldFocusNode,
                                readOnly: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelText:
                                      transactionTransactionsRow?.typeID == 1
                                          ? 'Withdrawal'
                                          : 'Deposit',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                validator: _model.textController2Validator
                                    .asValidator(context),
                              ),
                              if (transactionTransactionsRow?.image != null &&
                                  transactionTransactionsRow?.image != '')
                                Flexible(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      transactionTransactionsRow!.image!,
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.4,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await TransactionsTable().delete(
                                        matchingRows: (rows) => rows.eq(
                                          'TransactionID',
                                          widget.transactionID,
                                        ),
                                      );
                                      // Log
                                      unawaited(
                                        () async {
                                          await LogsTable().insert({
                                            'Details':
                                                'Deleted Transaction ID: ${transactionTransactionsRow?.transactionID.toString()}',
                                            'Title':
                                                'Approved ${transactionTransactionsRow?.typeID == 1 ? 'Withdrawal' : 'Deposit'}',
                                          });
                                        }(),
                                      );
                                      context.safePop();
                                    },
                                    text: 'Delete',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context).error,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
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
                                  FFButtonWidget(
                                    onPressed: () async {
                                      if (transactionTransactionsRow?.typeID ==
                                          1) {
                                        if (transactionTransactionsRow!.amount >
                                            containerUsersRow!.balance) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Insufficient Balance!'),
                                                content: const Text(
                                                    'User don\'t have enough money to Withdrawal.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          return;
                                        } else {
                                          await TransactionsTable().update(
                                            data: {
                                              'IsApprove': true,
                                              'Detail': 'Approve',
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'TransactionID',
                                              widget.transactionID,
                                            ),
                                          );
                                          unawaited(
                                            () async {
                                              await EdgeFunctionGroup
                                                  .updateBalanceCall
                                                  .call(
                                                money:
                                                    transactionTransactionsRow
                                                        .amount,
                                                action:
                                                    transactionTransactionsRow
                                                                .typeID ==
                                                            2
                                                        ? 'plus'
                                                        : 'minus',
                                                phoneNumber:
                                                    transactionTransactionsRow
                                                        .userPhoneNumber,
                                              );
                                            }(),
                                          );
                                          // Log
                                          unawaited(
                                            () async {
                                              await LogsTable().insert({
                                                'Details':
                                                    'Approved Transaction ID: ${transactionTransactionsRow.transactionID.toString()}',
                                                'Title':
                                                    'Approved ${transactionTransactionsRow.typeID == 1 ? 'Withdrawal' : 'Deposit'}',
                                              });
                                            }(),
                                          );
                                          unawaited(
                                            () async {
                                              await NotificationTable().insert({
                                                'Title': 'Approved',
                                                'Contents':
                                                    'Your request for ${transactionTransactionsRow.typeID == 1 ? 'Withdrawal' : 'Deposit'} is Approved.',
                                                'UserID':
                                                    containerUsersRow.userID,
                                              });
                                            }(),
                                          );
                                          context.safePop();
                                          return;
                                        }
                                      } else {
                                        await TransactionsTable().update(
                                          data: {
                                            'IsApprove': true,
                                            'Detail': 'Approve',
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'TransactionID',
                                            widget.transactionID,
                                          ),
                                        );
                                        unawaited(
                                          () async {
                                            await EdgeFunctionGroup
                                                .updateBalanceCall
                                                .call(
                                              money: transactionTransactionsRow
                                                  ?.amount,
                                              action: transactionTransactionsRow
                                                          ?.typeID ==
                                                      2
                                                  ? 'plus'
                                                  : 'minus',
                                              phoneNumber:
                                                  transactionTransactionsRow
                                                      ?.userPhoneNumber,
                                            );
                                          }(),
                                        );
                                        // Log
                                        unawaited(
                                          () async {
                                            await LogsTable().insert({
                                              'Details':
                                                  'Approved Transaction ID: ${transactionTransactionsRow?.transactionID.toString()}',
                                              'Title':
                                                  'Approved ${transactionTransactionsRow?.typeID == 1 ? 'Withdrawal' : 'Deposit'}',
                                            });
                                          }(),
                                        );
                                        unawaited(
                                          () async {
                                            await NotificationTable().insert({
                                              'Title': 'Approved',
                                              'Contents':
                                                  'Your request for ${transactionTransactionsRow?.typeID == 1 ? 'Withdrawal' : 'Deposit'} is Approved.',
                                              'UserID':
                                                  containerUsersRow?.userID,
                                            });
                                          }(),
                                        );
                                        context.safePop();
                                        return;
                                      }
                                    },
                                    text: 'Confirm',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
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
                                ],
                              ),
                            ].divide(const SizedBox(height: 15.0)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
