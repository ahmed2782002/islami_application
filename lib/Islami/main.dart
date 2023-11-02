import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Islami/Core/Provider/app_provider.dart';
import 'package:islami_app/Islami/Core/application_theme.dart';
import 'package:islami_app/Islami/modules/Hadeth/Hadeth_details_view.dart';
import 'package:islami_app/Islami/modules/Quran/quran_details_view.dart';
import 'package:islami_app/Islami/modules/home_layout.dart';
import 'package:islami_app/Islami/modules/spalsh_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext) => AppProvider(), child: const MyappMobile()));
}

class MyappMobile extends StatelessWidget {
  const MyappMobile({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,
      // Through it I can control the system whether light or dark by provider
      themeMode: appProvider.currentTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: SplashScreen.routeName,
      locale: Locale(appProvider.currentLocale),
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeLayout.routeName: (_) => const HomeLayout(),
        QuranDetailsView.routeName: (_) => const QuranDetailsView(),
        HadethDetailsView.routeName: (_) => const HadethDetailsView(),
      },
    );
  }
}
