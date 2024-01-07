import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'login_component_model.dart';
export 'login_component_model.dart';

class LoginComponentWidget extends StatefulWidget {
  const LoginComponentWidget({super.key});

  @override
  _LoginComponentWidgetState createState() => _LoginComponentWidgetState();
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
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.loginPhoneNumberController ??= TextEditingController();
    _model.loginPhoneNumberFocusNode ??= FocusNode();

    _model.loginPasswordController ??= TextEditingController();
    _model.loginPasswordFocusNode ??= FocusNode();

    _model.signUpFullNameController ??=
        TextEditingController(text: FFAppState().CreatAccountHolder.fullName);
    _model.signUpFullNameFocusNode ??= FocusNode();

    _model.signUpTelegramNumberController ??= TextEditingController(
        text: FFAppState().CreatAccountHolder.phoneNumber);
    _model.signUpTelegramNumberFocusNode ??= FocusNode();

    _model.signUpPasswordController ??=
        TextEditingController(text: FFAppState().CreatAccountHolder.password);
    _model.signUpPasswordFocusNode ??= FocusNode();
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
                                          .headlineMedium,
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
                                    if (UsersGroup.loginCall
                                                .errorMessage(
                                                  (_model.login?.jsonBody ??
                                                      ''),
                                                )
                                                .toString() !=
                                            '')
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Text(
                                            UsersGroup.loginCall
                                                .errorMessage(
                                                  (_model.login?.jsonBody ??
                                                      ''),
                                                )
                                                .toString(),
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
                                            _model.login =
                                                await UsersGroup.loginCall.call(
                                              phoneNumber: _model
                                                  .loginPhoneNumberController
                                                  .text,
                                              password: _model
                                                  .loginPasswordController.text,
                                            );
                                            shouldSetState = true;
                                            if ((_model.login?.succeeded ??
                                                true)) {
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              await authManager.signIn(
                                                authenticationToken: UsersGroup
                                                    .loginCall
                                                    .token(
                                                      (_model.login?.jsonBody ??
                                                          ''),
                                                    )
                                                    .toString(),
                                                authUid: UsersGroup.loginCall
                                                    .userID(
                                                      (_model.login?.jsonBody ??
                                                          ''),
                                                    )
                                                    .toString(),
                                              );
                                              await actions.onesignalLogin(
                                                UsersGroup.loginCall
                                                    .token(
                                                      (_model.login?.jsonBody ??
                                                          ''),
                                                    )
                                                    .toString(),
                                              );
                                              setState(() {
                                                FFAppState().IsLogged = true;
                                                FFAppState().UserInfo =
                                                    UserInfoStruct(
                                                  userID: UsersGroup.loginCall
                                                      .userID(
                                                    (_model.login?.jsonBody ??
                                                        ''),
                                                  ),
                                                  fullName: UsersGroup.loginCall
                                                      .fullName(
                                                        (_model.login
                                                                ?.jsonBody ??
                                                            ''),
                                                      )
                                                      .toString(),
                                                  phoneNumber:
                                                      UsersGroup.loginCall
                                                          .phoneNumber(
                                                            (_model.login
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          .toString(),
                                                  token: UsersGroup.loginCall
                                                      .token(
                                                        (_model.login
                                                                ?.jsonBody ??
                                                            ''),
                                                      )
                                                      .toString(),
                                                  sectorID: UsersGroup.loginCall
                                                      .sectorID(
                                                    (_model.login?.jsonBody ??
                                                        ''),
                                                  ),
                                                  isAdmin: UsersGroup.loginCall
                                                      .isAdmin(
                                                    (_model.login?.jsonBody ??
                                                        ''),
                                                  ),
                                                  profile: UsersGroup.loginCall
                                                      .profile(
                                                    (_model.login?.jsonBody ??
                                                        ''),
                                                  ),
                                                  userReferral:
                                                      UsersGroup.loginCall
                                                          .userReferral(
                                                            (_model.login
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          .toString(),
                                                  hashedPassword:
                                                      UsersGroup.loginCall
                                                          .hashedPassword(
                                                            (_model.login
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          .toString(),
                                                  isMember: UsersGroup.loginCall
                                                      .isMember(
                                                    (_model.login?.jsonBody ??
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
                                            height: 52.0,
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
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 20.0),
                                    child: Text(
                                      'Create Account',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge,
                                    ),
                                  ),
                                  Column(
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
                                                      m.storagePath,
                                                      context))) {
                                            setState(() =>
                                                _model.isDataUploading = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();

                                              downloadUrls =
                                                  await uploadSupabaseStorageFiles(
                                                bucketName: 'images',
                                                selectedFiles: selectedMedia,
                                              );
                                            } finally {
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
                                            } else {
                                              setState(() {});
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
                                            8.0, 0.0, 8.0, 0.0),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.8,
                                          child: TextFormField(
                                            controller:
                                                _model.signUpFullNameController,
                                            focusNode:
                                                _model.signUpFullNameFocusNode,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText: 'Full name',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            validator: _model
                                                .signUpFullNameControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.8,
                                          child: TextFormField(
                                            controller: _model
                                                .signUpTelegramNumberController,
                                            focusNode: _model
                                                .signUpTelegramNumberFocusNode,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText: 'Phone number',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .signUpTelegramNumberControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('^[^\\s]*\$'))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.8,
                                          child: TextFormField(
                                            controller:
                                                _model.signUpPasswordController,
                                            focusNode:
                                                _model.signUpPasswordFocusNode,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: !_model
                                                .signUpPasswordVisibility,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => _model
                                                          .signUpPasswordVisibility =
                                                      !_model
                                                          .signUpPasswordVisibility,
                                                ),
                                                focusNode: FocusNode(
                                                    skipTraversal: true),
                                                child: Icon(
                                                  _model.signUpPasswordVisibility
                                                      ? Icons
                                                          .visibility_outlined
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
                                                .signUpPasswordControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('^[^\\s]*\$'))
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (UsersGroup.checkPhoneNumberCall
                                                  .errorMessage(
                                                    (_model.apiResultwsd
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  .toString() !=
                                              '')
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Text(
                                              UsersGroup.checkPhoneNumberCall
                                                  .errorMessage(
                                                    (_model.apiResultwsd
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  .toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                    ].divide(const SizedBox(height: 10.0)),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var shouldSetState = false;
                                          if ((_model
                                                          .signUpFullNameController
                                                          .text !=
                                                      '') &&
                                              (_model.signUpTelegramNumberController
                                                          .text !=
                                                      '') &&
                                              (_model.signUpPasswordController
                                                          .text !=
                                                      '')) {
                                            _model.apiResultwsd =
                                                await UsersGroup
                                                    .checkPhoneNumberCall
                                                    .call(
                                              phoneNumber: _model
                                                  .signUpTelegramNumberController
                                                  .text,
                                            );
                                            shouldSetState = true;
                                            if ((_model
                                                    .apiResultwsd?.succeeded ??
                                                true)) {
                                              _model.createdUser =
                                                  await UsersTable().insert({
                                                'PhoneNumber': _model
                                                    .signUpTelegramNumberController
                                                    .text,
                                                'Password': _model
                                                    .signUpPasswordController
                                                    .text,
                                                'IsApprove': true,
                                                'IsActive': true,
                                                'Balance': 0.0,
                                                'SectorID': 1,
                                                'Profile': _model.uploadedFileUrl ==
                                                            ''
                                                    ? 'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png'
                                                    : _model.uploadedFileUrl,
                                                'FullName': _model
                                                    .signUpFullNameController
                                                    .text,
                                              });
                                              shouldSetState = true;
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              await authManager.signIn(
                                                authenticationToken:
                                                    _model.createdUser?.token,
                                                authUid: _model
                                                    .createdUser?.userID
                                                    .toString(),
                                              );
                                              await actions.onesignalLogin(
                                                _model.createdUser!.token,
                                              );
                                              setState(() {
                                                FFAppState()
                                                    .updateUserInfoStruct(
                                                  (e) => e
                                                    ..userID = _model
                                                        .createdUser?.userID
                                                    ..fullName = _model
                                                        .createdUser?.fullName
                                                    ..phoneNumber = _model
                                                        .createdUser
                                                        ?.phoneNumber
                                                    ..token = _model
                                                        .createdUser?.token
                                                    ..sectorID = _model
                                                        .createdUser?.sectorID
                                                    ..isAdmin = _model
                                                        .createdUser?.isAdmin
                                                    ..profile = _model
                                                        .createdUser?.profile
                                                    ..userReferral = _model
                                                        .createdUser
                                                        ?.userReferral
                                                    ..hashedPassword = _model
                                                        .createdUser?.password
                                                    ..isMember = _model
                                                        .createdUser?.isMember,
                                                );
                                                FFAppState().IsLogged = true;
                                              });

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
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Some fild is emty!'),
                                                  content: const Text(
                                                      'Please complete all the fild!'),
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
                                          height: 52.0,
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
                                  if (false)
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if ((_model.signUpFullNameController.text != '') &&
                                                (_model.signUpTelegramNumberController
                                                            .text !=
                                                        '') &&
                                                (_model.signUpPasswordController
                                                            .text !=
                                                        '')) {
                                              setState(() {
                                                FFAppState()
                                                    .updateCreatAccountHolderStruct(
                                                  (e) => e
                                                    ..fullName = _model
                                                        .signUpFullNameController
                                                        .text
                                                    ..phoneNumber = _model
                                                        .signUpTelegramNumberController
                                                        .text
                                                    ..password = _model
                                                        .signUpPasswordController
                                                        .text
                                                    ..sectorID =
                                                        _model.selectSectorID
                                                    ..profile =
                                                        valueOrDefault<String>(
                                                      _model.uploadedFileUrl,
                                                      'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png',
                                                    ),
                                                );
                                              });

                                              context
                                                  .pushNamed('AcountPayment');

                                              return;
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Some fild is emty!'),
                                                    content: const Text(
                                                        'Please complete all the fild!'),
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
                                            }
                                          },
                                          text: 'Next',
                                          options: FFButtonOptions(
                                            width: 230.0,
                                            height: 52.0,
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
                                ].divide(const SizedBox(height: 10.0)),
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
