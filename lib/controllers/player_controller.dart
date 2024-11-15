import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();

  var playingIndex = 0.obs;
  var isPlaying = false.obs;

  var duration = ''.obs;
  var position = ''.obs;

  var max = 0.0.obs;
  var value = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    checkPermission();
  }

  updatePosition() {
    audioPlayer.durationStream.listen((d) {
      duration.value = d.toString().split(".")[0];
      max.value = d!.inSeconds.toDouble();
    });
    audioPlayer.positionStream.listen((p) {
      position.value = p.toString().split('.')[0];
      value.value = p.inSeconds.toDouble();
    });
  }

  playSong(String? uri, index) {
    playingIndex.value = index;
    try {
      audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
      audioPlayer.play();
      isPlaying(true);
      updatePosition();
    } catch (e) {
      print(e.toString());
    }
  }

  changeDurationToSeconds(seconds) {
    var dur = Duration(seconds: seconds);
    audioPlayer.seek(dur);
  }

  checkPermission() async {
    var perm = await Permission.storage.request();

    if (perm.isGranted) {
      return audioQuery.querySongs();
    } else {
      checkPermission();
    }
  }
}
