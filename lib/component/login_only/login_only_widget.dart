import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'login_only_model.dart';
export 'login_only_model.dart';

class LoginOnlyWidget extends StatefulWidget {
  const LoginOnlyWidget({super.key});

  @override
  _LoginOnlyWidgetState createState() => _LoginOnlyWidgetState();
}

class _LoginOnlyWidgetState extends State<LoginOnlyWidget>
    with TickerProviderStateMixin {
  late LoginOnlyModel _model;

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
    _model = createModel(context, () => LoginOnlyModel());

    _model.loginPhoneNumberController ??= TextEditingController();
    _model.loginPhoneNumberFocusNode ??= FocusNode();

    _model.loginPasswordController ??= TextEditingController();
    _model.loginPasswordFocusNode ??= FocusNode();
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
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 40.0, 24.0, 0.0),
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
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 24.0),
                          child: Text(
                            'Fill out the information below in order to access your account.',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 16.0),
                          child: TextFormField(
                            controller: _model.loginPhoneNumberController,
                            focusNode: _model.loginPhoneNumberFocusNode,
                            textCapitalization: TextCapitalization.none,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Phone number',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).accent4,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
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
                            controller: _model.loginPasswordController,
                            focusNode: _model.loginPasswordFocusNode,
                            textCapitalization: TextCapitalization.none,
                            obscureText: !_model.loginPasswordVisibility,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Password',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).accent4,
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => _model.loginPasswordVisibility =
                                      !_model.loginPasswordVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.loginPasswordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.loginPasswordControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('^[^\\s]*\$'))
                            ],
                          ),
                        ),
                        if (UsersGroup.loginCall.errorMessage(
                                  (_model.login?.jsonBody ?? ''),
                                ) !=
                                null &&
                            UsersGroup.loginCall.errorMessage(
                                  (_model.login?.jsonBody ?? ''),
                                ) !=
                                '')
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Text(
                                UsersGroup.loginCall.errorMessage(
                                  (_model.login?.jsonBody ?? ''),
                                )!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).error,
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
                                _model.login = await UsersGroup.loginCall.call(
                                  phoneNumber:
                                      _model.loginPhoneNumberController.text,
                                  password: _model.loginPasswordController.text,
                                );
                                shouldSetState = true;
                                if ((_model.login?.succeeded ?? true)) {
                                  await actions.onesignalLogin(
                                    UsersGroup.loginCall.token(
                                      (_model.login?.jsonBody ?? ''),
                                    )!,
                                  );
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signIn(
                                    authenticationToken:
                                        UsersGroup.loginCall.token(
                                      (_model.login?.jsonBody ?? ''),
                                    ),
                                    authUid: UsersGroup.loginCall
                                        .userID(
                                          (_model.login?.jsonBody ?? ''),
                                        )
                                        ?.toString(),
                                  );
                                  setState(() {
                                    FFAppState().IsLogged = true;
                                    FFAppState().UserInfo = UserInfoStruct(
                                      userID: UsersGroup.loginCall.userID(
                                        (_model.login?.jsonBody ?? ''),
                                      ),
                                      fullName: UsersGroup.loginCall.fullName(
                                        (_model.login?.jsonBody ?? ''),
                                      ),
                                      phoneNumber:
                                          UsersGroup.loginCall.phoneNumber(
                                        (_model.login?.jsonBody ?? ''),
                                      ),
                                      token: UsersGroup.loginCall.token(
                                        (_model.login?.jsonBody ?? ''),
                                      ),
                                      sectorID: UsersGroup.loginCall.sectorID(
                                        (_model.login?.jsonBody ?? ''),
                                      ),
                                      isAdmin: UsersGroup.loginCall.isAdmin(
                                        (_model.login?.jsonBody ?? ''),
                                      ),
                                      profile: UsersGroup.loginCall.profile(
                                        (_model.login?.jsonBody ?? ''),
                                      ),
                                      userReferral:
                                          UsersGroup.loginCall.userReferral(
                                        (_model.login?.jsonBody ?? ''),
                                      ),
                                      hashedPassword:
                                          UsersGroup.loginCall.hashedPassword(
                                        (_model.login?.jsonBody ?? ''),
                                      ),
                                      isMember: UsersGroup.loginCall.isMember(
                                        (_model.login?.jsonBody ?? ''),
                                      ),
                                      isTestAccount:
                                          UsersGroup.loginCall.isTestAccount(
                                        (_model.login?.jsonBody ?? ''),
                                      ),
                                      invite: UsersGroup.loginCall
                                          .invite(
                                            (_model.login?.jsonBody ?? ''),
                                          )
                                          .toString(),
                                      isSubAdmin:
                                          UsersGroup.loginCall.isSubAdmin(
                                        (_model.login?.jsonBody ?? ''),
                                      ),
                                    );
                                  });
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context.pushNamedAuth(
                                      'HomePage', context.mounted);

                                  if (shouldSetState) setState(() {});
                                  return;
                                } else {
                                  if (shouldSetState) setState(() {});
                                  return;
                                }

                                if (shouldSetState) setState(() {});
                              },
                              text: 'Sign in',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
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
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await launchURL(
                                    'https://t.me/informal_economy');
                              },
                              child: Text(
                                'Support',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: const Color(0xFF1C81E0),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation']!),
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
