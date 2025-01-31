import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'show_shop_model.dart';
export 'show_shop_model.dart';

class ShowShopWidget extends StatefulWidget {
  const ShowShopWidget({
    super.key,
    this.locationPara,
  });

  final CustomMapLocationStruct? locationPara;

  @override
  State<ShowShopWidget> createState() => _ShowShopWidgetState();
}

class _ShowShopWidgetState extends State<ShowShopWidget> {
  late ShowShopModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowShopModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CompaniesRow>>(
      future: CompaniesTable().querySingleRow(
        queryFn: (q) => q.eq(
          'CompanyID',
          widget.locationPara?.id,
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
        List<CompaniesRow> showShopCompaniesRowList = snapshot.data!;

        final showShopCompaniesRow = showShopCompaniesRowList.isNotEmpty
            ? showShopCompaniesRowList.first
            : null;

        return Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'CompanyInfo',
                        queryParameters: {
                          'companyID': serializeParam(
                            showShopCompaniesRow.companyID,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                          ),
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: OctoImage(
                              placeholderBuilder: (_) => const SizedBox.expand(
                                child: Image(
                                  image: BlurHashImage(FFAppConstants.BlurHash),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              image: CachedNetworkImageProvider(
                                showShopCompaniesRow!.companyProfile,
                              ),
                              width: 150.0,
                              height: 200.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            width: 180.0,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 20.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      showShopCompaniesRow.companyName
                                          .maybeHandleOverflow(
                                        maxChars: 50,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Phone: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          TextSpan(
                                            text: valueOrDefault<String>(
                                              showShopCompaniesRow.phoneNumber,
                                              '0123456',
                                            ),
                                            style: const TextStyle(
                                              color: Color(0xFF1C81E0),
                                            ),
                                            mouseCursor:
                                                SystemMouseCursors.click,
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () async {
                                                if (isWeb) {
                                                  await actions.openUrl(
                                                    'tel:${showShopCompaniesRow.phoneNumber}',
                                                  );
                                                  return;
                                                } else {
                                                  await launchUrl(Uri(
                                                    scheme: 'tel',
                                                    path: showShopCompaniesRow
                                                        .phoneNumber,
                                                  ));
                                                  return;
                                                }
                                              },
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Telegram: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          TextSpan(
                                            text: showShopCompaniesRow
                                                .telegramUrl,
                                            style: const TextStyle(
                                              color: Color(0xFF1C81E0),
                                            ),
                                            mouseCursor:
                                                SystemMouseCursors.click,
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () async {
                                                await actions.openUrl(
                                                  showShopCompaniesRow
                                                      .telegramUrl,
                                                );
                                              },
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 20.0)),
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 20.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await actions.openUrl(
                      'google.navigation:q=${showShopCompaniesRow.latitude.toString()},${showShopCompaniesRow.longitude.toString()}&mode=d',
                    );
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.directions_rounded,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
