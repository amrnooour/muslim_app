import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim_app/model/details_screen_args.dart';
import 'package:muslim_app/ui/utils/app_assets.dart';
import 'package:muslim_app/ui/utils/app_colors.dart';
import 'package:muslim_app/ui/utils/app_theme.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName ="detailsScreen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenArgs arguments ;

  String fileContent ="";

  @override
  Widget build(BuildContext context) {
    arguments =ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if(fileContent.isEmpty) {
      readFile();
    }
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.background,),fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          title: Text(arguments.suraOrHadesName,style: AppTheme.appBarTitleTextStyle),
          centerTitle: true,
        ),
        backgroundColor: AppColors.transparent,
        body: fileContent.isEmpty ? Center(child: CircularProgressIndicator()) : Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
              child: Text(fileContent,style: TextStyle(fontSize: 24,color: AppColors.accent),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,)),
        ),
      ),
    );
  }

  void readFile() async{
   String file = await rootBundle.loadString(arguments.isQuranFile ?"assets/files/quran/${arguments.fileName}" :
   "assets/files/ahades/${arguments.fileName}");
   fileContent = file;
   List<String> fileLines =fileContent.split("\n");
   for(int i =0 ;i < fileLines.length;i++){
     fileLines[i] += arguments.isQuranFile ? "(${i+1})" : "  ";
   }
   fileContent = fileLines.join();
   setState(() {
   });
  }
}
