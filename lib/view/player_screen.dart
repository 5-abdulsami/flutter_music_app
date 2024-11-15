import 'package:flutter/material.dart';
import 'package:flutter_music_app/constants/colors.dart';
import 'package:flutter_music_app/constants/textstyle.dart';
import 'package:flutter_music_app/controllers/player_controller.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayerScreen extends StatelessWidget {
  final List<SongModel> data;
  const PlayerScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: 300,
                  width: 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: QueryArtworkWidget(
                    id: data[controller.playingIndex.value].id,
                    type: ArtworkType.AUDIO,
                    artworkHeight: double.infinity,
                    nullArtworkWidget: Icon(
                      Icons.music_note,
                      size: 48,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16))),
              child: Obx(
                () => Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      data[controller.playingIndex.value].displayNameWOExt,
                      style: textStyle(
                          color: bgColor,
                          fontWeight: FontWeight.bold,
                          size: 24),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      data[controller.playingIndex.value].artist.toString(),
                      style: textStyle(color: bgColor, size: 20),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Obx(
                      () => Row(
                        children: [
                          Text(
                            controller.position.value,
                            style: textStyle(color: bgColor),
                          ),
                          Expanded(
                              child: Slider(
                                  thumbColor: sliderColor,
                                  activeColor: sliderColor,
                                  inactiveColor: bgColor,
                                  min: const Duration(seconds: 0)
                                      .inSeconds
                                      .toDouble(),
                                  max: controller.max.value,
                                  value: controller.value.value,
                                  onChanged: (newValue) {
                                    controller.changeDurationToSeconds(
                                        newValue.toInt());
                                    newValue = newValue;
                                  })),
                          Text(
                            controller.duration.value,
                            style: textStyle(color: bgColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.playSong(
                                data[controller.playingIndex.value - 1].uri,
                                controller.playingIndex.value - 1);
                          },
                          icon: Icon(
                            Icons.skip_previous_rounded,
                            size: 40,
                            color: bgDarkColor,
                          ),
                        ),
                        Obx(
                          () => CircleAvatar(
                            radius: 35,
                            backgroundColor: bgColor,
                            child: Transform.scale(
                              scale: 1.4,
                              child: IconButton(
                                onPressed: () {
                                  if (controller.isPlaying.value) {
                                    controller.audioPlayer.pause();
                                    controller.isPlaying(false);
                                  } else {
                                    controller.audioPlayer.play();
                                    controller.isPlaying(true);
                                  }
                                },
                                icon: controller.isPlaying.value
                                    ? Icon(Icons.pause,
                                        size: 45, color: whiteColor)
                                    : Icon(
                                        Icons.play_arrow_rounded,
                                        size: 45,
                                        color: whiteColor,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.playSong(
                                data[controller.playingIndex.value + 1].uri,
                                controller.playingIndex.value + 1);
                          },
                          icon: Icon(
                            Icons.skip_next_rounded,
                            size: 40,
                            color: bgDarkColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
