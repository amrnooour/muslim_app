import 'package:flutter/material.dart';
import 'package:muslim_app/providers/settings_providers.dart';
import 'package:muslim_app/ui/utils/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:muslim_app/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int tasbeehCounter = 1;
  List<String> azkar =["سبحان الله" ,"الحمد لله","الله اكبر","لا اله الا الله"];
  int azkarCounter = 0;
  double angle =0;
  late SettingsProviders providers;

  @override
  Widget build(BuildContext context) {
    providers =Provider.of(context);
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: height*.1),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -height*.075,
                child: Padding(
                  padding: EdgeInsets.only(left: width*.1),
                  child: Image.asset(
                    height: height*0.1,
                    width: width*0.2,
                    providers.isDarkMode() ? AppAssets.headSebhaDark : AppAssets.headSebha,fit: BoxFit.fill,),
                ),
              ),
              GestureDetector(
                onTap: (){
                  tasbeehLogic();
                },
                child: Transform.rotate(
                  angle: angle,
                  child: Image.asset(
                      height: height*0.25,
                      width: width*0.5,
                      providers.isDarkMode() ? AppAssets.bodySebhaDark : AppAssets.bodySebha,fit: BoxFit.fill),
                ),
              ),
            ],
          ),
          SizedBox(height: height*.05,),
          Text(AppLocalizations.of(context)!.tasbeh,style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: height*.05,),
          Container(
            padding: EdgeInsets.all(height*.025),
            decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.57),borderRadius: BorderRadius.circular(25)),
            child: Text(tasbeehCounter.toString(),style: Theme.of(context).textTheme.displaySmall,),
          ),
          SizedBox(height: height*.05,),
          ElevatedButton(
              onPressed: (){
                tasbeehLogic();
              },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              backgroundColor: AppColors.accent
            ),
              child: Text(azkar[azkarCounter],style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.white),),
    )
        ],
      ),
    );
  }
  void tasbeehLogic(){
    if(tasbeehCounter==33){
      tasbeehCounter=1;
      azkarCounter++;
      if(azkarCounter==3){
        azkarCounter=0;
      }
    }else{
      tasbeehCounter++;
    }
    angle += 10;
    setState(() {
    });
  }
}
