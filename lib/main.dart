import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../firebase_options.dart';
import '../provider/general_provider.dart';
import 'constants.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GeneralProvider()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akshay Charwekar',
      theme: ThemeData(
        primarySwatch: themeColor,
        scaffoldBackgroundColor: scaffoldColor,
        textTheme: const TextTheme().copyWith(
          // Style used for link text or higlightet text
          bodyText1: GoogleFonts.firaCode().copyWith(
            color: linkTextColor,
          ),

          // Style applied directly in text widget
          bodyText2: GoogleFonts.inter().copyWith(
            color: textColor,
            fontSize: 18.00,
          ),

          headline4: GoogleFonts.firaCode().copyWith(
            color: linkTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 32.00,
          ),

          // Style used for subheading
          headline5: GoogleFonts.inter().copyWith(
            color: headingTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 30.00,
          ),

          // Style used for company name
          headline6: GoogleFonts.inter().copyWith(
            color: headingTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 22.00,
          ),

          // Style used for name
          headline1: GoogleFonts.inter().copyWith(
            color: headingTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 75.00,
          ),

          // Style used for quoted text
          headline2: GoogleFonts.inter().copyWith(
            color: quotedTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 75.00,
          ),

          subtitle1: GoogleFonts.inter().copyWith(
            color: textColor,
          ),
          subtitle2: GoogleFonts.inter().copyWith(
            color: textColor,
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: scaffoldColor,
          titleTextStyle: Theme.of(context).textTheme.headline5,
          contentTextStyle: Theme.of(context).textTheme.bodyText2,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: textColor),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: textColor),
          ),
          hintStyle: GoogleFonts.inter().copyWith(
            color: hintTextColor,
          ),
        ),
        cardTheme: CardTheme(
          color: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              defaultBorderRadius,
            ),
          ),
        ),
      ),
      home: kIsWeb ?  const LandingScreen() : const SplashScreen(),
      routes: {
        LandingScreen.routeName: (context) => const LandingScreen(),
        ResumeScreen.routeName: (context) => const ResumeScreen(),
      },
    );
  }
}
