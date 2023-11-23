import 'package:flutter/material.dart';
import 'package:muslim_app/model/details_screen_args.dart';
import 'package:muslim_app/ui/screens/details_screen/details_screen.dart';
import 'package:muslim_app/ui/utils/app_assets.dart';
import 'package:muslim_app/ui/utils/app_colors.dart';
import 'package:muslim_app/ui/utils/app_theme.dart';
import 'package:muslim_app/ui/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatelessWidget {
  List<String> ahadethTab = List.generate(50, (index) {
    return " الحديث رقم ${index+1} " ;
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(AppAssets.logoHadeth)),
        Divider(thickness: 3,color: AppColors.primary,),
        Center(child: Text(AppLocalizations.of(context)!.hadethName,style: Theme.of(context).textTheme.displayMedium)),
        Divider(thickness: 3,color: AppColors.primary,),
        Expanded(
          flex: 7,
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (_,index){
                return TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, DetailsScreen.routeName,arguments: DetailsScreenArgs(
                          suraOrHadesName: ahadethTab[index],
                          fileName: "h${index+1}.txt",
                          isQuranFile: false));
                    },
                    child: Text(ahadethTab[index],textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayMedium
                    ),);
              }),
        )
      ],);
  }
}
