import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:untitled/features/auth/domain/usecase/head_registration.usecase.dart';
import 'package:untitled/features/auth/domain/usecase/phone_auth.usecase.dart';
import 'package:untitled/features/auth/presentation/cubit/head_auth_cubit/head_registration_cubit.dart';
import 'package:untitled/features/auth/presentation/cubit/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:untitled/features/home/domain/usecase/member.usecase.dart';
import 'package:untitled/features/home/presentation/cubit/member_cubit.dart';
import 'config/injection/dependecy_injection.dart';
import 'core/routing.dart';
import 'design-system/app-theme/app_theme_cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  injectDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeCubit>(
        create: (context) => ThemeCubit(),
      ),
      BlocProvider<PhoneAuthCubit>(
        create: (context) => PhoneAuthCubit(phoneAuthUseCase: getIt<PhoneAuthUseCase>()),
      ),
      BlocProvider<HeadRegistrationCubit>(
        create: (context) => HeadRegistrationCubit(headRegistrationUseCase: getIt<HeadRegistrationUseCase>()),
      ),
      BlocProvider<MemberCubit>(
        create: (context) => MemberCubit(memberUseCase: getIt<MemberUseCase>()),
      ),
    ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => StyledToast(
        locale: const Locale('en', 'US'),
        textStyle: const TextStyle(fontSize: 16.0, color: Colors.white),
        backgroundColor: const Color(0x99000000),
        borderRadius: BorderRadius.circular(5.0),
        textPadding:
        const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
        toastPositions: StyledToastPosition.top,
        toastAnimation: StyledToastAnimation.slideFromTopFade,
        reverseAnimation: StyledToastAnimation.slideToTopFade,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
        duration: const Duration(seconds: 3),
        animDuration: const Duration(milliseconds: 200),
        dismissOtherOnShow: true,
        fullWidth: false,
        isHideKeyboard: true,
        isIgnoring: true,
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
                  return MaterialApp.router(
                      title: 'FamilyLink',
                      showPerformanceOverlay: false,
                      themeMode: ThemeMode.light,
                      debugShowCheckedModeBanner: false,
                      debugShowMaterialGrid: false,
                      theme: state.themeData,
                      builder: (context, child) => MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                            textScaler: TextScaler.linear(1.0)),
                        child: child ?? const SizedBox(),
                      ),
                      routerConfig: appRouter);
            },
          )
    ));
  }
}




