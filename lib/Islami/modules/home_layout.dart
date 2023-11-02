import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Islami//modules/Hadeth/hadeth_view.dart';
import 'package:islami_app/Islami//modules/Quran/quran_view.dart';
import 'package:islami_app/Islami//modules/Radio/radio.dart';
import 'package:islami_app/Islami//modules/Settings/setting.dart';
import 'package:islami_app/Islami//modules/Tasbeh/tasbeh.dart';
import 'package:islami_app/Islami/Core/Provider/app_provider.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatefulWidget {
  static String routeName = "home layout";

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;
  List<Widget> screens = const [
    QuranView(),
    HadethView(),
    TasbehView(),
    RadioView(),
    SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    var local = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(appProvider.getBackgroundImage()),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami),
        ),
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage("assets/images/Quran.png"),
              ),
              label: local.quran,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage("assets/images/hadth.png"),
              ),
              label: local.hadeth,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage("assets/images/sebha.png"),
              ),
              label: local.tasbeh,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage("assets/images/img.png"),
              ),
              label: local.radio,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: local.setting,
            ),
          ],
        ),
      ),
    );
  }
}
