import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/theme.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'constants.dart';
import 'model/app_state.dart';
import 'pages/home_page_with_bottomnav.dart';
import 'pages/home_page_with_railnav.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Shopping',
      theme: ThemeData(
        colorScheme: colorScheme,
        primaryColor: colorScheme.primary,
        accentColor: colorScheme.secondary,
        backgroundColor: colorScheme.background,
        tabBarTheme: TabBarTheme(
            indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 5.0,
            color: secondaryColor,
          ),
        )),
        textTheme: TextTheme(
          headline6: GoogleFonts.raleway(
            fontWeight: FontWeight.w700,
            fontSize: 22.0,
            height: 1.2,
            color: headlineTextColor,
          ),
          subtitle1: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            height: 1.5,
            color: subtitle1TextColor,
          ),
          bodyText1: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            height: 1.7,
            fontSize: 14.0,
            color: bodyText1Color,
          ),
        ),
      ),
      home: Builder(
        builder: (BuildContext context) {
          final width = MediaQuery.of(context).size.width;
          Widget widget;
          (width > LARGE_HANDSET_WIDTH) // is tablet
              ? widget = HomePageWithRailNav()
              : widget = HomePageWithBottomNav(); // otherwise is handset
          return widget;
        },
      ),
    );
  }
}
