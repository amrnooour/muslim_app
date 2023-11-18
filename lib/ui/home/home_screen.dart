import 'package:flutter/material.dart';
import 'package:muslim_app/ui/home/tabs/hadeth_tab.dart';
import 'package:muslim_app/ui/home/tabs/quran_tab.dart';
import 'package:muslim_app/ui/home/tabs/radio_tab.dart';
import 'package:muslim_app/ui/home/tabs/sebha_tab.dart';
import 'package:muslim_app/ui/utils/app_assets.dart';
import 'package:muslim_app/ui/utils/app_colors.dart';
import 'package:muslim_app/ui/utils/app_theme.dart';

class HomeScreen extends StatefulWidget {
  static const routeName ="home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List tabs =[QuranTab(),HadethTab(),SebhaTab(),RadioTab()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.background,),fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          title: const Text("Muslim",style: AppTheme.appBarTitleTextStyle),
        centerTitle: true,
        ),
        backgroundColor: AppColors.transparent,
        body: tabs[currentIndex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBottomNavigationBar()=> Theme(
    data: ThemeData(canvasColor: AppColors.primary),
    child: BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppColors.accent,
      iconSize: 32,
      onTap: (index){
        currentIndex =index;
        setState(() {
        });
      },
        items: const [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.iconQuran)),label: "Quran"),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.iconHadeth)),label: "Hadeth"),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.iconSebha)),label: "Sebha"),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.iconRadio)),label: "Radio"),
        ]),
  );
}
