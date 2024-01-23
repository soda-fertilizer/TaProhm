import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/supabase/supabase.dart';

import '/auth/custom_auth/custom_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  TaProhmAuthUser? initialUser;
  TaProhmAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(TaProhmAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => RootPageContext.wrap(
        appStateNotifier.loggedIn ? const HomePageWidget() : const HomePageWidget(),
        errorRoute: state.location,
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RootPageContext.wrap(
            appStateNotifier.loggedIn ? const HomePageWidget() : const HomePageWidget(),
          ),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'Locator',
          path: '/locator',
          builder: (context, params) => LocatorWidget(
            moveLocation: params.getParam('moveLocation', ParamType.LatLng),
            clickCompany: params.getParam('clickCompany', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'AcountPayment',
          path: '/acountPayment',
          builder: (context, params) => const AcountPaymentWidget(),
        ),
        FFRoute(
          name: 'Balance',
          path: '/balance',
          builder: (context, params) => const BalanceWidget(),
        ),
        FFRoute(
          name: 'MyCompany',
          path: '/myCompany',
          builder: (context, params) => const MyCompanyWidget(),
        ),
        FFRoute(
          name: 'CreateCompany',
          path: '/createCompany',
          builder: (context, params) => const CreateCompanyWidget(),
        ),
        FFRoute(
          name: 'PinLocation',
          path: '/pinLocation',
          builder: (context, params) => const PinLocationWidget(),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context, params) => const ProfileWidget(),
        ),
        FFRoute(
          name: 'Withdrawal',
          path: '/withdrawal',
          builder: (context, params) => const WithdrawalWidget(),
        ),
        FFRoute(
          name: 'Referral',
          path: '/referral',
          builder: (context, params) => const ReferralWidget(),
        ),
        FFRoute(
          name: 'LoginPage',
          path: '/loginPage',
          builder: (context, params) => const LoginPageWidget(),
        ),
        FFRoute(
          name: 'AdminMain',
          path: '/adminMain',
          builder: (context, params) => const AdminMainWidget(),
        ),
        FFRoute(
          name: 'ApproveCompany',
          path: '/approveCompany',
          builder: (context, params) => const ApproveCompanyWidget(),
        ),
        FFRoute(
          name: 'ApproveTransaction',
          path: '/approveTransaction',
          builder: (context, params) => const ApproveTransactionWidget(),
        ),
        FFRoute(
          name: 'ApproveAccount',
          path: '/approveAccount',
          builder: (context, params) => const ApproveAccountWidget(),
        ),
        FFRoute(
          name: 'Transfer',
          path: '/transfer',
          builder: (context, params) => TransferWidget(
            qrCode: params.getParam('qrCode', ParamType.String),
            amount: params.getParam('amount', ParamType.double),
          ),
        ),
        FFRoute(
          name: 'AdminMainReferral',
          path: '/adminMainReferral',
          builder: (context, params) => const AdminMainReferralWidget(),
        ),
        FFRoute(
          name: 'ReferralSubPage',
          path: '/referralSubPage',
          builder: (context, params) => ReferralSubPageWidget(
            userPhoneNumber:
                params.getParam('userPhoneNumber', ParamType.String),
            tabIndex: params.getParam('tabIndex', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'Account',
          path: '/account',
          builder: (context, params) => AccountWidget(
            userID: params.getParam('userID', ParamType.int),
            sectorID: params.getParam('sectorID', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'Company',
          path: '/company',
          builder: (context, params) => CompanyWidget(
            companyID: params.getParam('companyID', ParamType.int),
            userID: params.getParam('userID', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'Transaction',
          path: '/transaction',
          builder: (context, params) => TransactionWidget(
            transactionID: params.getParam('transactionID', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'CompanyPayment',
          path: '/companyPayment',
          builder: (context, params) => const CompanyPaymentWidget(),
        ),
        FFRoute(
          name: 'ViewCompany',
          path: '/viewCompany',
          builder: (context, params) => ViewCompanyWidget(
            companyID: params.getParam('companyID', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'Deposit',
          path: '/deposit',
          builder: (context, params) => const DepositWidget(),
        ),
        FFRoute(
          name: 'CompanyInfo',
          path: '/companyInfo',
          builder: (context, params) => CompanyInfoWidget(
            companyID: params.getParam('companyID', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'SingleCompanyMap',
          path: '/singleCompanyMap',
          builder: (context, params) => SingleCompanyMapWidget(
            companyID: params.getParam('companyID', ParamType.int),
            companyLatitude:
                params.getParam('companyLatitude', ParamType.double),
            companyLongitude:
                params.getParam('companyLongitude', ParamType.double),
          ),
        ),
        FFRoute(
          name: 'EditCompany',
          path: '/editCompany',
          builder: (context, params) => EditCompanyWidget(
            companyID: params.getParam('companyID', ParamType.int),
            name: params.getParam('name', ParamType.String),
            phoneNumber: params.getParam('phoneNumber', ParamType.String),
            link: params.getParam('link', ParamType.String),
            discount: params.getParam('discount', ParamType.double),
            haveDocument: params.getParam('haveDocument', ParamType.bool),
            location: params.getParam('location', ParamType.LatLng),
            images: params.getParam<String>('images', ParamType.String, true),
            profile: params.getParam('profile', ParamType.String),
            detail: params.getParam('detail', ParamType.String),
            userID: params.getParam('userID', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'GraphTree',
          path: '/graphTree',
          builder: (context, params) => GraphTreeWidget(
            users:
                params.getParam<UsersRow>('users', ParamType.SupabaseRow, true),
            headOfUser:
                params.getParam<UsersRow>('headOfUser', ParamType.SupabaseRow),
          ),
        ),
        FFRoute(
          name: 'ChangePassword',
          path: '/changePassword',
          builder: (context, params) => const ChangePasswordWidget(),
        ),
        FFRoute(
          name: 'EditAccount',
          path: '/editAccount',
          builder: (context, params) => EditAccountWidget(
            userID: params.getParam('userID', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'AdminCreateUser',
          path: '/adminCreateUser',
          builder: (context, params) => const AdminCreateUserWidget(),
        ),
        FFRoute(
          name: 'AdminAccount',
          path: '/adminAccount',
          builder: (context, params) => const AdminAccountWidget(),
        ),
        FFRoute(
          name: 'AdminBusinesses',
          path: '/adminBusinesses',
          builder: (context, params) => const AdminBusinessesWidget(),
        ),
        FFRoute(
          name: 'SearchCompany',
          path: '/searchCompany',
          builder: (context, params) => const SearchCompanyWidget(),
        ),
        FFRoute(
          name: 'About',
          path: '/about',
          builder: (context, params) => const AboutWidget(),
        ),
        FFRoute(
          name: 'Event',
          path: '/event',
          builder: (context, params) => const EventWidget(),
        ),
        FFRoute(
          name: 'Notification',
          path: '/notification',
          builder: (context, params) => const NotificationWidget(),
        ),
        FFRoute(
          name: 'UnderMaintenance',
          path: '/underMaintenance',
          builder: (context, params) => const UnderMaintenanceWidget(),
        ),
        FFRoute(
          name: 'MemberPayment',
          path: '/memberPayment',
          builder: (context, params) => MemberPaymentWidget(
            name: params.getParam('name', ParamType.String),
            referral: params.getParam('referral', ParamType.String),
            password: params.getParam('password', ParamType.String),
            sectorID: params.getParam('sectorID', ParamType.int),
            isNewMember: params.getParam('isNewMember', ParamType.bool),
            profile: params.getParam('profile', ParamType.String),
            phoneNumber: params.getParam('phoneNumber', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'TeamPayment',
          path: '/teamPayment',
          builder: (context, params) => TeamPaymentWidget(
            name: params.getParam('name', ParamType.String),
            referral: params.getParam('referral', ParamType.String),
            invite: params.getParam('invite', ParamType.String),
            password: params.getParam('password', ParamType.String),
            sectorID: params.getParam('sectorID', ParamType.int),
            profile: params.getParam('profile', ParamType.String),
            phoneNumber: params.getParam('phoneNumber', ParamType.String),
            isNew: params.getParam('isNew', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'SubAdminMain',
          path: '/subAdminMain',
          builder: (context, params) => const SubAdminMainWidget(),
        ),
        FFRoute(
          name: 'SubAdminBusinesses',
          path: '/subAdminBusinesses',
          builder: (context, params) => const SubAdminBusinessesWidget(),
        ),
        FFRoute(
          name: 'AdminAccountPayment',
          path: '/adminAccountPayment',
          builder: (context, params) => AdminAccountPaymentWidget(
            name: params.getParam('name', ParamType.String),
            referral: params.getParam('referral', ParamType.String),
            password: params.getParam('password', ParamType.String),
            sectorID: params.getParam('sectorID', ParamType.int),
            isMember: params.getParam('isMember', ParamType.bool),
            profile: params.getParam('profile', ParamType.String),
            phoneNumber: params.getParam('phoneNumber', ParamType.String),
            inviteID: params.getParam('inviteID', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'InvideMember',
          path: '/invideMember',
          builder: (context, params) => const InvideMemberWidget(),
        ),
        FFRoute(
          name: 'EventDetails',
          path: '/eventDetails',
          builder: (context, params) => EventDetailsWidget(
            id: params.getParam('id', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'AdminCreateEvent',
          path: '/adminCreateEvent',
          builder: (context, params) => const AdminCreateEventWidget(),
        ),
        FFRoute(
          name: 'AdminSubAccount',
          path: '/adminSubAccount',
          builder: (context, params) => AdminSubAccountWidget(
            phoneNumeber: params.getParam('phoneNumeber', ParamType.String),
            tabIndex: params.getParam('tabIndex', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'SubAdminAccount',
          path: '/subAdminAccount',
          builder: (context, params) => const SubAdminAccountWidget(),
        ),
        FFRoute(
          name: 'SubAdminSubAccount',
          path: '/subAdminSubAccount',
          builder: (context, params) => SubAdminSubAccountWidget(
            phoneNumber: params.getParam('phoneNumber', ParamType.String),
            tabIndex: params.getParam('tabIndex', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'AdminEventDetails',
          path: '/adminEventDetails',
          builder: (context, params) => AdminEventDetailsWidget(
            id: params.getParam('id', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'EditEvent',
          path: '/editEvent',
          builder: (context, params) => EditEventWidget(
            id: params.getParam('id', ParamType.int),
            evenDate: params.getParam('evenDate', ParamType.DateTime),
            image: params.getParam('image', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Member',
          path: '/member',
          builder: (context, params) => const MemberWidget(),
        ),
        FFRoute(
          name: 'Review',
          path: '/review',
          builder: (context, params) => ReviewWidget(
            companyID: params.getParam('companyID', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'MemberDetail',
          path: '/memberDetail',
          builder: (context, params) => MemberDetailWidget(
            id: params.getParam('id', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'ViewReview',
          path: '/viewReview',
          builder: (context, params) => ViewReviewWidget(
            id: params.getParam('id', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'ReviewList',
          path: '/reviewList',
          builder: (context, params) => ReviewListWidget(
            companyID: params.getParam('companyID', ParamType.double),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/homePage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: Center(
                    child: Image.asset(
                      'assets/images/vnimc_1.png',
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
