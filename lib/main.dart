import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:muslim_app/providers/settings_providers.dart';
import 'package:muslim_app/shared_preferance/prefs_helper.dart';
import 'package:muslim_app/ui/home/home_screen.dart';
import 'package:muslim_app/ui/screens/details_screen/details_screen.dart';
import 'package:muslim_app/ui/screens/splash_screen/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:muslim_app/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  PrefsHelper.prefs = await SharedPreferences.getInstance();
  runApp( ChangeNotifierProvider(
    create: (_) => SettingsProviders()..init(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingsProviders providers;

  @override
  Widget build(BuildContext context) {
    providers =Provider.of(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale("en"),Locale("ar")],
      locale: Locale(providers.currentLocale),
      themeMode: providers.currentMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName :(_)=>SplashScreen(),
        HomeScreen.routeName :(_)=>HomeScreen(),
        DetailsScreen.routeName :(_)=> DetailsScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
