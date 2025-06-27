import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/features/home/home_page.dart';

import '../features/auth/presentation/view/head_registartion/head_registration_main_view.dart';
import '../features/auth/presentation/view/signup/otp_view.dart';
import '../features/auth/presentation/view/signup/sign_up_view.dart';
import '../features/home/presentation/add_member/add_member_view.dart';
import '../features/splash_screen.dart';

final appNavigationKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
    navigatorKey: appNavigationKey,
    initialLocation: SplashScreen.path,
    routes: [
      GoRoute(
        path: SplashScreen.path,
        name: SplashScreen.name,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: SignupView.path,
        name: SignupView.name,
        builder: (context, state) => SignupView(),
      ),
      GoRoute(
        path: OtpView.path,
        name: OtpView.name,
        builder: (context, state) {
          final phone = state.extra as String;
          return OtpView(phoneNumber: phone);
        },
      ),
      GoRoute(
        path: HomeView.path,
        name: HomeView.name,
        builder: (context, state) {
          final headId = state.extra as String;

        return  HomeView(
            headId: headId,
          );
        },
      ),
      GoRoute(
        path: AddFamilyMemberView.path,
        name: AddFamilyMemberView.name,
        builder: (context, state) {
          final args = state.extra as AddMemberArgs;
          return AddFamilyMemberView(addMemberArgs: args);
        },
      ),
      GoRoute(
        path: HeadRegistrationView.path,
        name: HeadRegistrationView.name,
        builder: (context, state) {
          final phone = state.extra as String;
          return HeadRegistrationView(phoneNumber: phone);
        },
      ),
    ]);
