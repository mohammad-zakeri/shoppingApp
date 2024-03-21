import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/feature_intro/presentation/screens/intro_main_wrapper.dart';
import 'common/blocs/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'common/widgets/main_wrapper.dart';
import 'config/my_theme.dart';
import 'feature_splash/presentation/bloc/splash_cubit.dart';
import 'feature_splash/presentation/screens/splash_screen.dart';
import 'locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();

  await initLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> SplashCubit()),
        BlocProvider(create: (_)=> BottomNavCubit()),
        // BlocProvider(create: (_) => locator<SignupBloc>()),
        // BlocProvider(create: (_) => locator<LoginBloc>()),
      ],
      child: const MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shopping app',
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,

      initialRoute: "/",
      locale: const Locale("fa",""),

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale("en",""),
        Locale("fa",""),
      ],

      routes: {
        IntroMainWrapper.routeName: (context)=> IntroMainWrapper(),
        MainWrapper.routeName: (context)=> MainWrapper(),
        // MobileSignUpScreen.routeName: (context)=> MobileSignUpScreen(),
        // AllProductsScreen.routeName: (context)=> AllProductsScreen(),
      },

      home: const SplashScreen(),
    );

  }

}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
