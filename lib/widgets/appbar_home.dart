// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok_favorite_gesture/tiktok_favorite_gesture.dart';

class AppBarHome extends StatefulWidget implements PreferredSizeWidget {
  var data;
  AppBarHome({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<AppBarHome> createState() => _AppBarHomeState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _AppBarHomeState extends State<AppBarHome> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: InkWell(
        onTap: () {
          if (widget.data.imageModel.nextPage != null) {
            widget.data.page++;
            widget.data.getImage();
            widget.data.playAudioClick();
          }
        },
        child: Row(
          children: [
            InkWell(
              onTap: () {
                if (widget.data.imageModel.nextPage != null &&
                    widget.data.page > 1) {
                  widget.data.page--;
                  widget.data.getImage();
                  widget.data.playAudioClick();
                }
              },
              child: Icon(
                Icons.arrow_circle_left_sharp,
                color: Color.fromARGB(255, 255, 17, 0),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "page ${widget.data.page}",
              style:
                  GoogleFonts.abrilFatface(fontSize: 25, color: Colors.white),
            ),
            SizedBox(
              width: 12,
            ),
            Icon(
              Icons.arrow_circle_right_sharp,
              color: Color.fromARGB(255, 0, 140, 255),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: TiktokFavoriteGesture(
            onAddFavorite: () {
              print("object");
            },
            onSingleTap: () {
              print("object");
            },
            child: TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "Fire",
                      style: GoogleFonts.pacifico(
                          color: Color.fromARGB(255, 0, 140, 255),
                          fontSize: 22),
                    ),
                    Text(
                      "Wallpaper",
                      style: GoogleFonts.pacifico(
                          color: Color.fromARGB(255, 255, 17, 0), fontSize: 22),
                    ),
                  ],
                )),
          ),
        )
      ],
      centerTitle: false,
    );
  }
}
