import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/data/api_manager.dart';
import 'package:muslim_app/data/model/RadiosModel.dart';
import 'package:muslim_app/ui/utils/app_assets.dart';
import 'package:muslim_app/ui/utils/app_colors.dart';
import 'package:muslim_app/ui/widgets/Radio_item.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({Key? key}) : super(key: key);

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  late AudioPlayer audioPlayer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer =AudioPlayer();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Image.asset(AppAssets.radioImage,height: height*.2,width: width,),
        Spacer(),
        FutureBuilder<List<Radios>?>(
            future: ApiMAnager.getRadios(),
            builder: (context,snapshot){
              if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()),);
              }else if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }else{
                return SizedBox(
                  height: height*.3,
                  child: ListView.builder(
                    physics: PageScrollPhysics(),
                      itemExtent: width,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.length??0,
                      itemBuilder: (context,index){
                        return RadioItem(radios: snapshot.data![index],audioPlayer: audioPlayer,);
                      }),
                );
              }
            }),
        Spacer(),
      ],
    );
  }
}
