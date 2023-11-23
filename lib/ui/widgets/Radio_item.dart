import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/data/model/RadiosModel.dart';
import 'package:muslim_app/ui/utils/app_colors.dart';

class RadioItem extends StatelessWidget {
  final Radios radios;
  final AudioPlayer audioPlayer;
  const RadioItem({Key? key,required this.radios,required this.audioPlayer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text(radios.name??"",style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: height*.1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){
              play();
            },
                iconSize: 50,
                color: AppColors.primary,
                icon: Icon(Icons.play_arrow)),
            IconButton(onPressed: (){
              stop();
            },
                iconSize: 50,
                color: AppColors.primary,
                icon: Icon(Icons.pause)),
          ],
        ),
      ],
    );
  }

  void play()async{
    await audioPlayer.play(UrlSource(radios.url??""));
  }

  void stop()async{
    await audioPlayer.stop();
  }
}
