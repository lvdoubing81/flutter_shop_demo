/// 播放语音
///
///
import "dart:async";

import "package:audioplayers/audio_cache.dart";
import 'package:audioplayers/audioplayers.dart';


class SoundHelper{
  static AudioCache player = AudioCache(prefix: "sounds/");

//  static Future<void> loadAll() async {
//    List<SoundName> soundNames = <SoundName>[
//      SoundName.beep,
//      SoundName.has_new_item,
//      SoundName.invalid_location,
//      SoundName.ok,
//      SoundName.order_has_complete,
//      SoundName.please_scan_batch_no,
//      SoundName.please_scan_fabric_no,
//      SoundName.please_scan_location,
//      SoundName.repeat_scan,
//      SoundName.scan_complete,
//      SoundName.system_error,
//      SoundName.unidentified_data,
//      SoundName.wrong_batch_no,
//      SoundName.wrong_fabric_no,
//      SoundName.wrong_order_no,
//    ];
//    player.loadAll(soundNames.map(getSoundFile).toList());
//  }
  
  static Future<void> play(SoundName soundName) async {
    //var player = AudioCache(prefix: "sounds/");
    await player.play(getSoundFile(soundName));
    print("=== playing ${getSoundFile(soundName)}");
  }

  static Future<void> playUrl(String url) async {
    var player = AudioPlayer();
    var result = player.play(url);
    print(result);
  }

  static String getSoundFile(SoundName soundName){
//    var dict = <SoundName, String>{
//      SoundName.beep: "beep.ogg",
//      SoundName.has_new_item: "有新的物料.mp3",
//      SoundName.invalid_location: "架位不对吧.mp3",
//      SoundName.ok: "好的.mp3",
//      SoundName.order_has_complete: "订单已经被处理啦.mp3",
//      SoundName.please_scan_batch_no: "请扫描缸号.mp3",
//      SoundName.please_scan_fabric_no: "请扫描布号.mp3",
//      SoundName.please_scan_location: "请扫描架位号.mp3",
//      SoundName.repeat_scan: "重复扫描.mp3",
//      SoundName.scan_complete: "扫描完了.mp3",
//      SoundName.system_error: "系统错误.mp3",
//      SoundName.unidentified_data: "不能识别的数据.mp3",
//      SoundName.wrong_batch_no: "缸号错了吧.mp3",
//      SoundName.wrong_fabric_no: "布号错了.mp3",
//      SoundName.wrong_order_no: "错误的订单号.mp3",
//    };

    var dict = <SoundName, String>{
      SoundName.beep: "beep.ogg",
      SoundName.has_new_item: "has_new_item.mp3",
      SoundName.invalid_location: "location_is_wrong.mp3",
      SoundName.ok: "ok.mp3",
      SoundName.order_has_complete: "order_has_complete.mp3",
      SoundName.please_scan_batch_no: "please_scan_batch_no.mp3",
      SoundName.please_scan_fabric_no: "please_scan_fabric_no.mp3",
      SoundName.please_scan_location: "please_scan_location.mp3",
      SoundName.repeat_scan: "repeat_scan.mp3",
      SoundName.scan_complete: "scan_complete.mp3",
      SoundName.system_error: "system_error.mp3",
      SoundName.unidentified_data: "unidentified_data.mp3",
      SoundName.wrong_batch_no: "batch_no_is_wrong.mp3",
      SoundName.wrong_fabric_no: "fabric_no_is_wrong.mp3",
      SoundName.wrong_order_no: "order_no_is_wrong.mp3",
    };

    return dict[soundName];
  }
}

enum SoundName {
  beep,
  has_new_item,
  invalid_location,
  ok,
  order_has_complete,
  please_scan_batch_no,
  please_scan_fabric_no,
  please_scan_location,
  repeat_scan,
  scan_complete,
  system_error,
  unidentified_data,
  wrong_batch_no,
  wrong_fabric_no,
  wrong_order_no,
}