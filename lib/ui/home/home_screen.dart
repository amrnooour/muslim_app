import 'package:flutter/material.dart';
import 'package:muslim_app/providers/settings_providers.dart';
import 'package:muslim_app/ui/home/tabs/hadeth_tab.dart';
import 'package:muslim_app/ui/home/tabs/quran_tab.dart';
import 'package:muslim_app/ui/home/tabs/radio_tab.dart';
import 'package:muslim_app/ui/home/tabs/sebha_tab.dart';
import 'package:muslim_app/ui/home/tabs/settings_tab.dart';
import 'package:muslim_app/ui/utils/app_assets.dart';
import 'package:muslim_app/ui/utils/app_colors.dart';
import 'package:muslim_app/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName ="home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List tabs =[QuranTab(),HadethTab(),SebhaTab(),RadioTab(),SettingsTab()];
  int currentIndex = 0;
  late SettingsProviders providers;

  @override
  Widget build(BuildContext context) {
    providers =Provider.of(context);
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(
        providers.isDarkMode() ? AppAssets.darkBackground :AppAssets.background,),fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.muslim,),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBottomNavigationBar()=> Theme(
    data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
    child: BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        currentIndex =index;
        setState(() {
        });
      },
        items: [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.iconQuran)),label: "Quran"),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.iconHadeth)),label: "Hadeth"),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.iconSebha)),label: "Sebha"),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.iconRadio)),label: "Radio"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: AppLocalizations.of(context)!.settings),
        ]),
  );
}
