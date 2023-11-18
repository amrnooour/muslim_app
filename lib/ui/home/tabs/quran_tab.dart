import 'package:flutter/material.dart';
import 'package:muslim_app/model/details_screen_args.dart';
import 'package:muslim_app/ui/screens/details_screen/details_screen.dart';
import 'package:muslim_app/ui/utils/app_assets.dart';
import 'package:muslim_app/ui/utils/app_colors.dart';
import 'package:muslim_app/ui/utils/app_theme.dart';
import 'package:muslim_app/ui/utils/constants.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Expanded(
          flex: 3,
          child: Image.asset(AppAssets.logoQuran)),
        Divider(thickness: 3,color: AppColors.primary,),
        Center(child: Text("Sura Name",style: AppTheme.quranTabTitleTextStyle)),
        Divider(thickness: 3,color: AppColors.primary,),
        Expanded(
          flex: 7,
          child: ListView.builder(
              itemCount: Constants.suraNames.length,
              itemBuilder: (_,index){
                return TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, DetailsScreen.routeName,arguments: DetailsScreenArgs(
                          suraOrHadesName: Constants.suraNames[index],
                          fileName: "${index+1}.txt",
                          isQuranFile: true));
                    },
                    child: Text(Constants.suraNames[index],textAlign: TextAlign.center,style: AppTheme.quranTabTitleTextStyle.copyWith(
                      fontWeight: FontWeight.normal
                    ),));
              }),
        )
      ],);
  }
}
