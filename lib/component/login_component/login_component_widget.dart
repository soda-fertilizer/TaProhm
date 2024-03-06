import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'login_component_model.dart';
export 'login_component_model.dart';

class LoginComponentWidget extends StatefulWidget {
  const LoginComponentWidget({super.key});

  @override
  State<LoginComponentWidget> createState() => _LoginComponentWidgetState();
}

class _LoginComponentWidgetState extends State<LoginComponentWidget>
    with TickerProviderStateMixin {
  late LoginComponentModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 80.0),
          end: const Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 400.ms,
          begin: const Offset(0.8, 0.8),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginComponentModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 1,
    )..addListener(() => setState(() {}));
    _model.loginPhoneNumberController ??= TextEditingController();
    _model.loginPhoneNumberFocusNode ??= FocusNode();

    _model.loginPasswordController ??= TextEditingController();
    _model.loginPasswordFocusNode ??= FocusNode();

    _model.singUpFullNameController ??= TextEditingController();
    _model.singUpFullNameFocusNode ??= FocusNode();

    _model.signUPPasswordController ??= TextEditingController();
    _model.signUPPasswordFocusNode ??= FocusNode();

    _model.signUpPhoneNumberController ??= TextEditingController();
    _model.signUpPhoneNumberFocusNode ??= FocusNode();

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

    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                height:
                    MediaQuery.sizeOf(context).width >= 768.0 ? 530.0 : 630.0,
                constraints: const BoxConstraints(
                  maxWidth: 570.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: const Alignment(0.0, 0),
                        child: FlutterFlowButtonTabBar(
                          useToggleButtonStyle: true,
                          isScrollable: true,
                          labelStyle: FlutterFlowTheme.of(context).titleMedium,
                          unselectedLabelStyle: const TextStyle(),
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          unselectedBackgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 12.0,
                          elevation: 0.0,
                          labelPadding: const EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          tabs: const [
                            Tab(
                              text: 'Sign In',
                            ),
                            Tab(
                              text: 'Sign Up',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 16.0, 24.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                    ))
                                      Container(
                                        width: 230.0,
                                        height: 16.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    Text(
                                      'Welcome Back',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 22.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 24.0),
                                      child: Text(
                                        'Fill out the information below in order to access your account.',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 16.0),
                                      child: TextFormField(
                                        controller:
                                            _model.loginPhoneNumberController,
                                        focusNode:
                                            _model.loginPhoneNumberFocusNode,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Phone number',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .loginPhoneNumberControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('^[^\\s]*\$'))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 16.0),
                                      child: TextFormField(
                                        controller:
                                            _model.loginPasswordController,
                                        focusNode:
                                            _model.loginPasswordFocusNode,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        obscureText:
                                            !_model.loginPasswordVisibility,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Password',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => _model
                                                      .loginPasswordVisibility =
                                                  !_model
                                                      .loginPasswordVisibility,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.loginPasswordVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .loginPasswordControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('^[^\\s]*\$'))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 15.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await launchURL(
                                                      'https://t.me/TaProhmAppSupport');
                                                },
                                                child: Text(
                                                  'Forgot password',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            const Color(0xFF1C81E0),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await launchURL(
                                                      'https://t.me/informal_economy');
                                                },
                                                child: Text(
                                                  'Support',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            const Color(0xFF1C81E0),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (valueOrDefault<String>(
                                          UsersGroup.loginCall.errorMessage(
                                            (_model.login2?.jsonBody ?? ''),
                                          ),
                                          'null',
                                        ) !=
                                        'null')
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              UsersGroup.loginCall.errorMessage(
                                                (_model.login2?.jsonBody ?? ''),
                                              ),
                                              'null',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                ),
                                          ),
                                        ),
                                      ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            var shouldSetState = false;
                                            _model.login2 =
                                                await UsersGroup.loginCall.call(
                                              phoneNumber: _model
                                                  .loginPhoneNumberController
                                                  .text,
                                              password: _model
                                                  .loginPasswordController.text,
                                            );
                                            shouldSetState = true;
                                            if ((_model.login2?.succeeded ??
                                                true)) {
                                              _model.fcmToken = await actions
                                                  .initFirebaseMessage();
                                              shouldSetState = true;
                                              if (_model.fcmToken != null &&
                                                  _model.fcmToken != '') {
                                                unawaited(
                                                  () async {
                                                    await UsersTable().update(
                                                      data: {
                                                        'Token':
                                                            _model.fcmToken,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'UserID',
                                                        UsersGroup.loginCall
                                                            .userID(
                                                          (_model.login2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                      ),
                                                    );
                                                  }(),
                                                );
                                              }
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              await authManager.signIn(
                                                authenticationToken:
                                                    UsersGroup.loginCall
                                                        .userID(
                                                          (_model.login2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        ?.toString(),
                                                authUid: UsersGroup.loginCall
                                                    .userID(
                                                      (_model.login2
                                                              ?.jsonBody ??
                                                          ''),
                                                    )
                                                    ?.toString(),
                                              );
                                              setState(() {
                                                FFAppState().IsLogged = true;
                                                FFAppState().UserInfo =
                                                    UserInfoStruct(
                                                  userID: UsersGroup.loginCall
                                                      .userID(
                                                    (_model.login2?.jsonBody ??
                                                        ''),
                                                  ),
                                                  fullName: UsersGroup.loginCall
                                                      .fullName(
                                                    (_model.login2?.jsonBody ??
                                                        ''),
                                                  ),
                                                  phoneNumber: UsersGroup
                                                      .loginCall
                                                      .phoneNumber(
                                                    (_model.login2?.jsonBody ??
                                                        ''),
                                                  ),
                                                  sectorID: UsersGroup.loginCall
                                                      .sectorID(
                                                    (_model.login2?.jsonBody ??
                                                        ''),
                                                  ),
                                                  isAdmin: UsersGroup.loginCall
                                                      .isAdmin(
                                                    (_model.login2?.jsonBody ??
                                                        ''),
                                                  ),
                                                  profile: UsersGroup.loginCall
                                                      .profile(
                                                    (_model.login2?.jsonBody ??
                                                        ''),
                                                  ),
                                                  userReferral: UsersGroup
                                                      .loginCall
                                                      .userReferral(
                                                    (_model.login2?.jsonBody ??
                                                        ''),
                                                  ),
                                                  hashedPassword: UsersGroup
                                                      .loginCall
                                                      .hashedPassword(
                                                    (_model.login2?.jsonBody ??
                                                        ''),
                                                  ),
                                                  isMember: UsersGroup.loginCall
                                                      .isMember(
                                                    (_model.login2?.jsonBody ??
                                                        ''),
                                                  ),
                                                  isTestAccount: UsersGroup
                                                      .loginCall
                                                      .isTestAccount(
                                                    (_model.login2?.jsonBody ??
                                                        ''),
                                                  ),
                                                  invite: UsersGroup.loginCall
                                                      .invite(
                                                        (_model.login2
                                                                ?.jsonBody ??
                                                            ''),
                                                      )
                                                      .toString(),
                                                  isSubAdmin: UsersGroup
                                                      .loginCall
                                                      .isSubAdmin(
                                                    (_model.login2?.jsonBody ??
                                                        ''),
                                                  ),
                                                  token: UsersGroup.loginCall
                                                      .token(
                                                    (_model.login2?.jsonBody ??
                                                        ''),
                                                  ),
                                                );
                                              });
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamedAuth(
                                                  'HomePage', context.mounted);

                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                              return;
                                            } else {
                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                              return;
                                            }

                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                          },
                                          text: 'Sign in',
                                          options: FFButtonOptions(
                                            width: 230.0,
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
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
                                                    ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation']!),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        storageFolderPath: 'Users',
                                        maxWidth: 1080.00,
                                        maxHeight: 1080.00,
                                        allowPhoto: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls =
                                              await uploadSupabaseStorageFiles(
                                            bucketName: 'images',
                                            selectedFiles: selectedMedia,
                                          );
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl =
                                                downloadUrls.first;
                                          });
                                          showUploadMessage(
                                              context, 'Success!');
                                        } else {
                                          setState(() {});
                                          showUploadMessage(
                                              context, 'Failed to upload data');
                                          return;
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          _model.uploadedFileUrl,
                                          'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 5.0),
                                    child: Text(
                                      'Picture Profile',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      child: TextFormField(
                                        controller:
                                            _model.singUpFullNameController,
                                        focusNode:
                                            _model.singUpFullNameFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Full Name',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .singUpFullNameControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      child: TextFormField(
                                        controller:
                                            _model.signUPPasswordController,
                                        focusNode:
                                            _model.signUPPasswordFocusNode,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        obscureText:
                                            !_model.signUPPasswordVisibility,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Password',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => _model
                                                      .signUPPasswordVisibility =
                                                  !_model
                                                      .signUPPasswordVisibility,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.signUPPasswordVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: const Color(0xFF757575),
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .signUPPasswordControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('^[^\\s]*\$'))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      child: TextFormField(
                                        controller:
                                            _model.signUpPhoneNumberController,
                                        focusNode:
                                            _model.signUpPhoneNumberFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Phone number',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 14.0,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLength: 11,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        buildCounter: (context,
                                                {required currentLength,
                                                required isFocused,
                                                maxLength}) =>
                                            null,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .signUpPhoneNumberControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[0-9]'))
                                        ],
                                      ),
                                    ),
                                  ),
                                  FutureBuilder<List<UsersRow>>(
                                    future: UsersTable().queryRows(
                                      queryFn: (q) => q
                                          .eq(
                                            'UserReferral',
                                            '000002',
                                          )
                                          .order('UserID', ascending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<UsersRow>
                                          singUpProvinceUsersRowList =
                                          snapshot.data!;
                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .singUpProvinceValueController ??=
                                            FormFieldController<String>(null),
                                        options: singUpProvinceUsersRowList
                                            .map((e) => e.fullName)
                                            .toList(),
                                        onChanged: (val) async {
                                          setState(() =>
                                              _model.singUpProvinceValue = val);
                                          setState(() {
                                            _model.selectReferralAndInvite =
                                                singUpProvinceUsersRowList
                                                    .where((e) =>
                                                        _model
                                                            .singUpProvinceValue ==
                                                        e.fullName)
                                                    .toList()
                                                    .first
                                                    .phoneNumber;
                                            _model.selectedProvince =
                                                singUpProvinceUsersRowList
                                                    .where((e) =>
                                                        _model
                                                            .singUpProvinceValue ==
                                                        e.fullName)
                                                    .toList()
                                                    .first
                                                    .phoneNumber;
                                          });
                                        },
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        height: 40.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 14.0,
                                            ),
                                        hintText: 'Please select province',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        borderWidth: 1.0,
                                        borderRadius: 30.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      );
                                    },
                                  ),
                                  if (_model.selectedProvince != '')
                                    FutureBuilder<List<UsersRow>>(
                                      future: UsersTable().queryRows(
                                        queryFn: (q) => q.eq(
                                          'UserReferral',
                                          _model.selectedProvince,
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
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<UsersRow>
                                            singUpDistrictUsersRowList =
                                            snapshot.data!;
                                        return FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .singUpDistrictValueController ??=
                                              FormFieldController<String>(null),
                                          options: singUpDistrictUsersRowList
                                              .map((e) => e.fullName)
                                              .toList(),
                                          onChanged: (val) async {
                                            setState(() => _model
                                                .singUpDistrictValue = val);
                                            setState(() {
                                              _model.selectReferralAndInvite =
                                                  singUpDistrictUsersRowList
                                                      .where((e) =>
                                                          _model
                                                              .singUpDistrictValue ==
                                                          e.fullName)
                                                      .toList()
                                                      .first
                                                      .phoneNumber;
                                            });
                                          },
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.8,
                                          height: 40.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 14.0,
                                                  ),
                                          hintText: 'Please select district',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 0.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          borderWidth: 1.0,
                                          borderRadius: 30.0,
                                          margin:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        );
                                      },
                                    ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    decoration: const BoxDecoration(),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var shouldSetState = false;
                                          if (functions.returnLength(_model
                                                  .signUpPhoneNumberController
                                                  .text) >
                                              6) {
                                            if ((_model.singUpFullNameController.text != '') &&
                                                (_model.signUPPasswordController
                                                            .text !=
                                                        '') &&
                                                (_model.signUpPhoneNumberController
                                                            .text !=
                                                        '')) {
                                              if ((_model.singUpDistrictValue !=
                                                          null &&
                                                      _model.singUpDistrictValue !=
                                                          '') &&
                                                  (_model.singUpProvinceValue !=
                                                          null &&
                                                      _model.singUpProvinceValue !=
                                                          '')) {
                                                _model.checkPhoneNumber =
                                                    await UsersGroup
                                                        .checkPhoneNumberCall
                                                        .call(
                                                  phoneNumber: _model
                                                      .signUpPhoneNumberController
                                                      .text,
                                                );
                                                shouldSetState = true;
                                                if ((_model.checkPhoneNumber
                                                        ?.succeeded ??
                                                    true)) {
                                                  _model.createdUser =
                                                      await UsersTable()
                                                          .insert({
                                                    'PhoneNumber': _model
                                                        .signUpPhoneNumberController
                                                        .text,
                                                    'Password': _model
                                                        .signUPPasswordController
                                                        .text,
                                                    'Balance': 0.0,
                                                    'SectorID':
                                                        _model.selectSectorID,
                                                    'Profile': _model.uploadedFileUrl !=
                                                                ''
                                                        ? _model.uploadedFileUrl
                                                        : 'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png',
                                                    'FullName': _model
                                                        .singUpFullNameController
                                                        .text,
                                                    'UserReferral': _model
                                                        .selectReferralAndInvite,
                                                    'IsMember': false,
                                                    'Invite': _model
                                                        .selectReferralAndInvite,
                                                  });
                                                  shouldSetState = true;
                                                  // Notification
                                                  await BroadcastNotificationTable()
                                                      .insert({
                                                    'Title':
                                                        'Welcome ${_model.singUpFullNameController.text}',
                                                    'Contents':
                                                        'Welcome to our new member  ${_model.singUpFullNameController.text}',
                                                    'Image': _model.uploadedFileUrl !=
                                                                ''
                                                        ? _model.uploadedFileUrl
                                                        : 'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png',
                                                  });
                                                  GoRouter.of(context)
                                                      .prepareAuthEvent();
                                                  await authManager.signIn(
                                                    authenticationToken: _model
                                                        .createdUser?.userID
                                                        .toString(),
                                                    authUid: _model
                                                        .createdUser?.userID
                                                        .toString(),
                                                  );
                                                  _model.token = await actions
                                                      .initFirebaseMessage();
                                                  shouldSetState = true;
                                                  if (_model.token != 'null') {
                                                    _model.updateToken =
                                                        await UsersTable()
                                                            .update(
                                                      data: {
                                                        'Token': _model.token,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'UserID',
                                                        _model.createdUser
                                                            ?.userID,
                                                      ),
                                                      returnRows: true,
                                                    );
                                                    shouldSetState = true;
                                                  }
                                                  setState(() {
                                                    FFAppState().UserInfo =
                                                        UserInfoStruct(
                                                      userID: _model
                                                          .createdUser?.userID,
                                                      fullName: _model
                                                          .createdUser
                                                          ?.fullName,
                                                      phoneNumber: _model
                                                          .createdUser
                                                          ?.phoneNumber,
                                                      token: _model.token,
                                                      sectorID: _model
                                                          .createdUser
                                                          ?.sectorID,
                                                      isAdmin: _model
                                                          .createdUser?.isAdmin,
                                                      profile: _model
                                                          .createdUser?.profile,
                                                      userReferral: _model
                                                          .createdUser
                                                          ?.userReferral,
                                                      hashedPassword: _model
                                                          .createdUser
                                                          ?.password,
                                                      isMember: _model
                                                          .createdUser
                                                          ?.isMember,
                                                      isTestAccount: _model
                                                          .createdUser
                                                          ?.isTestAccount,
                                                      invite: _model
                                                          .createdUser?.invite,
                                                      isSubAdmin: _model
                                                          .createdUser
                                                          ?.isSubAdmin,
                                                    );
                                                    FFAppState().IsLogged =
                                                        true;
                                                  });
                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamedAuth(
                                                    'HomePage',
                                                    context.mounted,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );

                                                  if (shouldSetState) {
                                                    setState(() {});
                                                  }
                                                  return;
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'You can\'t use this phone number!'),
                                                        content: const Text(
                                                            'Please try another phone number.'),
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
                                                  if (shouldSetState) {
                                                    setState(() {});
                                                  }
                                                  return;
                                                }
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'District or Province is not selected'),
                                                      content: const Text(
                                                          'Please select district or province!'),
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
                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                                return;
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Some field are emty.'),
                                                    content: const Text(
                                                        'Please make sure you input all your infomation!'),
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
                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                              return;
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Phone number is not correct.'),
                                                  content: const Text(
                                                      'Phone number can\'t be less then 6 number.'),
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
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          }

                                          if (shouldSetState) setState(() {});
                                        },
                                        text: 'Sign Up',
                                        options: FFButtonOptions(
                                          width: 230.0,
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
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
                                                  ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 5.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
          ],
        ),
      ),
    );
  }
}
