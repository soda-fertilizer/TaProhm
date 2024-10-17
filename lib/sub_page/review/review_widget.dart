import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'review_model.dart';
export 'review_model.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({
    super.key,
    required this.companyID,
  });

  final int? companyID;

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  late ReviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultsmu = await CompanyGroup.checkRatingCall.call(
        userId: FFAppState().UserInfo.userID,
        companyId: widget.companyID,
      );

      if ((_model.apiResultsmu?.succeeded ?? true)) {
        _model.readyRating = true;
        _model.isLoaded = true;
        safeSetState(() {});
        return;
      } else {
        _model.readyRating = false;
        _model.isLoaded = true;
        safeSetState(() {});
        return;
      }
    });

    _model.detailTextController ??= TextEditingController();
    _model.detailFocusNode ??= FocusNode();

    _model.readyDetailFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Review',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
              title: Text(
                'Review',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Builder(
                builder: (context) {
                  if (_model.isLoaded) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!_model.readyRating)
                          Container(
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RatingBar.builder(
                                    onRatingUpdate: (newValue) => safeSetState(
                                        () => _model.ratingBarValue = newValue),
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star_rounded,
                                      color: Color(0xFFFFD700),
                                    ),
                                    direction: Axis.horizontal,
                                    initialRating: _model.ratingBarValue ??=
                                        3.0,
                                    unratedColor: const Color(0x66FFD700),
                                    itemCount: 5,
                                    itemSize: 40.0,
                                    glowColor: const Color(0xFFFFD700),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 200.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller:
                                              _model.detailTextController,
                                          focusNode: _model.detailFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Details',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                          maxLines: null,
                                          validator: _model
                                              .detailTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await CompaniesRatingTable().insert({
                                        'UserID': FFAppState().UserInfo.userID,
                                        'CompanyID': widget.companyID,
                                        'Rating':
                                            _model.ratingBarValue?.round(),
                                        'Detail':
                                            _model.detailTextController.text,
                                      });
                                      context.safePop();
                                    },
                                    text: 'Save',
                                    options: FFButtonOptions(
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
                                            letterSpacing: 0.0,
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
                            ),
                          ),
                        if (_model.readyRating)
                          FutureBuilder<List<CompaniesRatingRow>>(
                            future: CompaniesRatingTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'ID',
                                CompanyGroup.checkRatingCall.id(
                                  (_model.apiResultsmu?.jsonBody ?? ''),
                                ),
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
                              List<CompaniesRatingRow>
                                  updateReviewCompaniesRatingRowList =
                                  snapshot.data!;

                              final updateReviewCompaniesRatingRow =
                                  updateReviewCompaniesRatingRowList.isNotEmpty
                                      ? updateReviewCompaniesRatingRowList.first
                                      : null;

                              return Container(
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      RatingBar.builder(
                                        onRatingUpdate: (newValue) =>
                                            safeSetState(() =>
                                                _model.readyRatingBarValue =
                                                    newValue),
                                        itemBuilder: (context, index) => const Icon(
                                          Icons.star_rounded,
                                          color: Color(0xFFFFD700),
                                        ),
                                        direction: Axis.horizontal,
                                        initialRating:
                                            _model.readyRatingBarValue ??=
                                                updateReviewCompaniesRatingRow!
                                                    .rating!
                                                    .toDouble(),
                                        unratedColor: const Color(0x66FFD700),
                                        itemCount: 5,
                                        itemSize: 40.0,
                                        glowColor: const Color(0xFFFFD700),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 200.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller: _model
                                                      .readyDetailTextController ??=
                                                  TextEditingController(
                                                text:
                                                    updateReviewCompaniesRatingRow
                                                        ?.detail,
                                              ),
                                              focusNode:
                                                  _model.readyDetailFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Details',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLines: null,
                                              validator: _model
                                                  .readyDetailTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await CompaniesRatingTable().update(
                                            data: {
                                              'Rating': _model
                                                  .readyRatingBarValue
                                                  ?.round(),
                                              'Detail': _model
                                                  .readyDetailTextController
                                                  .text,
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'ID',
                                              CompanyGroup.checkRatingCall.id(
                                                (_model.apiResultsmu
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                            ),
                                          );
                                          context.safePop();
                                        },
                                        text: 'Update',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    );
                  } else {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(),
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Loding...',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ));
  }
}
