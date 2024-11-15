import 'package:flutter/material.dart';
import 'package:flutter_music_app/constants/colors.dart';
import 'package:flutter_music_app/constants/textstyle.dart';
import 'package:flutter_music_app/controllers/player_controller.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayerScreen extends StatelessWidget {
  final SongModel data;
  const PlayerScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 300,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: QueryArtworkWidget(
                id: data.id,
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
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    data.displayNameWOExt,
                    style: textStyle(
                        color: bgColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    data.artist.toString(),
                    style: textStyle(color: bgColor, fontSize: 20),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        "00:00",
                        style: textStyle(color: bgColor),
                      ),
                      Expanded(
                          child: Slider(
                              thumbColor: sliderColor,
                              activeColor: sliderColor,
                              inactiveColor: bgColor,
                              value: 0.0,
                              onChanged: (newValye) {})),
                      Text(
                        "4:00",
                        style: textStyle(color: bgColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
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
                            scale: 2.5,
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
                                      size: 54, color: whiteColor)
                                  : Icon(
                                      Icons.play_arrow_rounded,
                                      size: 54,
                                      color: whiteColor,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
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
          )
        ],
      ),
    );
  }
}
