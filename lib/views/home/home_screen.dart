import 'package:flutter/material.dart';

import '../../services/audio_service.dart';
class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 final List<String> names =['a','b','c','d','e','f'];

   Map<int,bool> isPlay={
     0:false,
     1:false,
     2:false,
     3:false,
     4:false,
     5:false,
   };

  @override
  void initState() {
    AudioService.initSound();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
           ...List.generate(6,
                   (index) =>
                       Card(
                         margin:const EdgeInsets.all(10) ,
                       child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Row(
                           children: [
                              CircleAvatar(
                                radius: 15,
                                child: Text(names[index],
                                ),
                              ),
                             const Spacer(),
                             InkWell(
                               onTap:(){
                                 (! isPlay[index]!)?
                                 AudioService.playSound(index):
                                 AudioService.pauseSound() ;

                                 setState(() {
                                   isPlay[index] = !isPlay[index]!;
                                 });
                               } ,
                                 child:  Icon(
                                   (! isPlay[index]!)? Icons.play_circle:
                                   Icons.pause_circle,
                                 color: (! isPlay[index]!)?
                                 Colors.redAccent:null,
                                 ),
                             ),
                           ],
                         ),
                       ),
                   ),
           ),
        ]
        ),
      ) ,
    );
  }
}
