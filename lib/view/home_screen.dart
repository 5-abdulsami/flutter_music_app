import 'package:flutter/material.dart';
import 'package:flutter_music_app/constants/colors.dart';
import 'package:flutter_music_app/constants/textstyle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgDarkColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: whiteColor,
              ))
        ],
        leading: Icon(
          Icons.sort_outlined,
          color: whiteColor,
        ),
        title: Text(
          "Flutter Music",
          style: textStyle(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 100,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  tileColor: bgColor,
                  title: Text(
                    "Music Name: ",
                    style: textStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  subtitle: Text(
                    "Artist Name: ",
                    style: textStyle(fontSize: 12),
                  ),
                  leading: Icon(
                    Icons.music_note,
                    color: whiteColor,
                    size: 32,
                  ),
                  trailing: Icon(
                    Icons.play_arrow,
                    color: whiteColor,
                    size: 26,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
