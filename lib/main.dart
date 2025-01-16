import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/style/colorsmanger.dart';
import 'package:islami/style/prefsHelper.dart';
import 'package:islami/ui/hadith_details/screen/hadith_details_screen.dart';
import 'package:islami/ui/home/screen/home_screen.dart';
import 'package:islami/ui/onboarding/screen/onboarding_screen.dart';
import 'package:islami/ui/splash/screen/splash_screen.dart';
import 'package:islami/ui/sura_details/screen/suradetails_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  await PrefHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorManger.primary,
          selectionHandleColor: ColorManger.primary.withValues(alpha: 0.7),
          selectionColor: ColorManger.primary.withValues(alpha: 0.7)
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        SplashScreen.routeName:(_)=>SplashScreen(),
        HomeScreen.routeName:(_)=>HomeScreen(),
        OnboardingScreen.routeName:(_)=>OnboardingScreen(),
        SuradetailsScreen.routName:(_)=>SuradetailsScreen(),
        HadithDetailsScreen.routName:(_)=>HadithDetailsScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}


