import '/backend/supabase/supabase.dart';
import '/component/show_k_h_q_r/show_k_h_q_r_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'team_payment_model.dart';
export 'team_payment_model.dart';

class TeamPaymentWidget extends StatefulWidget {
  const TeamPaymentWidget({
    Key? key,
    required this.name,
    required this.referral,
    required this.invite,
    required this.password,
    required this.sectorID,
    required this.profile,
    required this.phoneNumber,
    required this.isNew,
  }) : super(key: key);

  final String? name;
  final String? referral;
  final String? invite;
  final String? password;
  final int? sectorID;
  final String? profile;
  final String? phoneNumber;
  final bool? isNew;

  @override
  _TeamPaymentWidgetState createState() => _TeamPaymentWidgetState();
}

class _TeamPaymentWidgetState extends State<TeamPaymentWidget> {
  late TeamPaymentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamPaymentModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(cameraPermission);
      await requestPermission(photoLibraryPermission);
      if ((await getPermissionStatus(cameraPermission)) &&
          (await getPermissionStatus(photoLibraryPermission))) {
        return;
      }

      await requestPermission(cameraPermission);
      await requestPermission(photoLibraryPermission);
      return;
    });
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Color(0x73000000),
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: ShowKHQRWidget(),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/khqr.png',
                              width: 30.0,
                              height: 30.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.isNew! ? '\$ 200' : '\$ 50',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).displayMedium,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.3,
              decoration: BoxDecoration(),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(
                            'https://pay.ababank.com/KYfxEcUDrhbSp3F18');
                      },
                      child: Container(
                        width: 100.0,
                        height: 75.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/aba.jpg',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ABA Pay',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          'Click to pay',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(
                            'https://acledabank.com.kh/acleda?payment_data=qWY5B2SAUfIhLblxzOtfu8yRyA1YGYQ90srEOvcavYJlvCsAPlnE+KZKiMaf0qCB008tY/6/la639aRo6PWMGHDZlgm60e5FP6SbHHzy4FfoVJYOQKeQOxFjGisuPDk7jMSfSKil2ChwxO9ImDn65jsJdTeMlFZ3/Q45Ni5cbQXXA/cgzWE1PeC1qbyt+YHLOwrSqCsrmsx25WDDvF9O3G87tp60aWSEJze6A/+cOQo=&key=khqr');
                      },
                      child: Container(
                        width: 100.0,
                        height: 75.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/acleda.png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Acleda Pay',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          'Click to pay',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(
                            'https://wingmoney.app.link/l8Qk905COEb');
                      },
                      child: Container(
                        width: 100.0,
                        height: 75.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/wing.png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Wing Pay',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          'Click to pay',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
            Container(
              width: double.infinity,
              height: 39.0,
              decoration: BoxDecoration(
                color: Color(0xFFE9ECEE),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Add image',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              _model.uploadedImage = null;
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/icons8-remove-48.png',
                              width: 30.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            // Upload1
                            final selectedMedia = await selectMedia(
                              storageFolderPath: 'Users',
                              maxWidth: 1080.00,
                              maxHeight: 1080.00,
                              mediaSource: MediaSource.photoGallery,
                              multiImage: false,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isDataUploading1 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = await uploadSupabaseStorageFiles(
                                  bucketName: 'images',
                                  selectedFiles: selectedMedia,
                                );
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading1 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile1 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl1 = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }

                            setState(() {
                              _model.uploadedImage = _model.uploadedFileUrl1;
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/icons8-image-48.png',
                              width: 30.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
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
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isDataUploading2 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = await uploadSupabaseStorageFiles(
                                  bucketName: 'images',
                                  selectedFiles: selectedMedia,
                                );
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading2 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile2 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl2 = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }

                            setState(() {
                              _model.uploadedImage = _model.uploadedFileUrl2;
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/icons8-camera-48.png',
                              width: 30.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                ],
              ),
            ),
            if (_model.uploadedImage != null && _model.uploadedImage != '')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    valueOrDefault<String>(
                      _model.uploadedImage,
                      'https://placehold.co/300x200/c4cdd3/f0f0f0',
                    ),
                    width: double.infinity,
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await UsersTable().insert({
                    'PhoneNumber': widget.phoneNumber,
                    'Password': widget.password,
                    'PaymentImage': _model.uploadedImage,
                    'Balance': 0.0,
                    'SectorID': widget.sectorID,
                    'Profile': widget.profile,
                    'FullName': widget.name,
                    'UserReferral': widget.referral,
                    'IsMember': false,
                    'Invite': widget.invite,
                  });
                  unawaited(
                    () async {}(),
                  );
                  context.safePop();
                },
                text: 'Active',
                options: FFButtonOptions(
                  width: 230.0,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondary,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge,
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
