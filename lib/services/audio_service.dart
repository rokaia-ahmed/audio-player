import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

class AudioService{
  static final _assetsAudioPlayer = AssetsAudioPlayer();
  static final List<Audio> _paths =[
    Audio("assets/audios/note1.mp3"),
    Audio("assets/audios/note2.mp3"),
    Audio("assets/audios/note3.mp3"),
    Audio("assets/audios/note4.mp3"),
    Audio("assets/audios/note5.mp3"),
    Audio("assets/audios/song.mp3"),
  ];
 static void initSound(){
    try{
      _assetsAudioPlayer.open(
          Playlist(
              startIndex: 0,
              audios:_paths,
          ),
          autoStart: false,
          loopMode: LoopMode.playlist
      );
     // _assetsAudioPlayer.play();
    }catch(e){
      debugPrint('===========================error when play sound $e');
    }
  }

  static void playSound(index){
    try{
      _assetsAudioPlayer.playlistPlayAtIndex(index);
    }catch(e){
      debugPrint('error when stop sound $e');
    }
  }

  static void pauseSound(){
    try{
      _assetsAudioPlayer.pause();
    }catch(e){
      debugPrint('error when stop sound $e');
    }
  }

}