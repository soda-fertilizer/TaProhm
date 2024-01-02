import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'sub_admin_businesses_model.dart';
export 'sub_admin_businesses_model.dart';

class SubAdminBusinessesWidget extends StatefulWidget {
  const SubAdminBusinessesWidget({super.key});

  @override
  _SubAdminBusinessesWidgetState createState() =>
      _SubAdminBusinessesWidgetState();
}

class _SubAdminBusinessesWidgetState extends State<SubAdminBusinessesWidget> {
  late SubAdminBusinessesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubAdminBusinessesModel());
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
      future: UsersTable().queryRows(
        queryFn: (q) => q.eq(
          'SectorID',
          FFAppState().UserInfo.sectorID,
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
        List<UsersRow> subAdminBusinessesUsersRowList = snapshot.data!;
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
                  'Businesses',
                  style: FlutterFlowTheme.of(context).titleMedium,
                ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                child: FutureBuilder<List<CompaniesRow>>(
                  future: (_model.requestCompleter ??=
                          Completer<List<CompaniesRow>>()
                            ..complete(CompaniesTable().queryRows(
                              queryFn: (q) => q
                                  .eq(
                                    'IsApprove',
                                    true,
                                  )
                                  .eq(
                                    'IsActive',
                                    true,
                                  )
                                  .in_(
                                    'UserID',
                                    subAdminBusinessesUsersRowList
                                        .map((e) => e.userID)
                                        .toList(),
                                  )
                                  .order('CompanyID'),
                            )))
                      .future,
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
                    List<CompaniesRow> listViewCompaniesRowList =
                        snapshot.data!;
                    return RefreshIndicator(
                      onRefresh: () async {
                        FFAppState().clearAdminRequestAccountCache();
                        setState(() => _model.requestCompleter = null);
                        await _model.waitForRequestCompleted();
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewCompaniesRowList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewCompaniesRow =
                              listViewCompaniesRowList[listViewIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 1.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'EditCompany',
                                  queryParameters: {
                                    'companyID': serializeParam(
                                      listViewCompaniesRow.companyID,
                                      ParamType.int,
                                    ),
                                    'name': serializeParam(
                                      listViewCompaniesRow.companyName,
                                      ParamType.String,
                                    ),
                                    'phoneNumber': serializeParam(
                                      listViewCompaniesRow.phoneNumber,
                                      ParamType.String,
                                    ),
                                    'link': serializeParam(
                                      listViewCompaniesRow.telegramUrl,
                                      ParamType.String,
                                    ),
                                    'discount': serializeParam(
                                      listViewCompaniesRow.discount,
                                      ParamType.double,
                                    ),
                                    'haveDocument': serializeParam(
                                      listViewCompaniesRow.isVertify,
                                      ParamType.bool,
                                    ),
                                    'location': serializeParam(
                                      functions.returnLatLng(
                                          listViewCompaniesRow.latitude,
                                          listViewCompaniesRow.longitude),
                                      ParamType.LatLng,
                                    ),
                                    'images': serializeParam(
                                      listViewCompaniesRow.companyImages,
                                      ParamType.String,
                                      true,
                                    ),
                                    'profile': serializeParam(
                                      listViewCompaniesRow.companyProfile,
                                      ParamType.String,
                                    ),
                                    'detail': serializeParam(
                                      listViewCompaniesRow.detail,
                                      ParamType.String,
                                    ),
                                    'userID': serializeParam(
                                      listViewCompaniesRow.userID,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                width: 100.0,
                                height: 72.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      offset: const Offset(0.0, 1.0),
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(44.0),
                                          child: Image.network(
                                            listViewCompaniesRow.companyProfile,
                                            width: 44.0,
                                            height: 44.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: Text(
                                                  listViewCompaniesRow
                                                      .companyName
                                                      .maybeHandleOverflow(
                                                    maxChars: 30,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge,
                                                ),
                                              ),
                                              Text(
                                                listViewCompaniesRow
                                                    .phoneNumber,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
