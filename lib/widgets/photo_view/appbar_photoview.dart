import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class AppBarPhotoView extends StatelessWidget implements PreferredSizeWidget {
  var data;
  var image;
  var where;
  var sqlDb;
  AppBarPhotoView({
    Key? key,
    required this.data,
    required this.image,
    required this.where,
    required this.sqlDb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
          onPressed: () {
            data.playAudioClick();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
      actions: [
        where != 3
            ? OutlinedButton.icon(
                onPressed: () async {
                  await sqlDb.insertData(
                      '''INSERT INTO images(url) VALUES("$image")''');
                  data.selectData();
                  data.playAudioLove();
                  MotionToast(
                    icon: Icons.favorite,
                    primaryColor: Color.fromARGB(255, 255, 255, 255),
                    secondaryColor: Color.fromARGB(255, 255, 17, 0),
                    backgroundType: BackgroundType.solid,
                    title: Text('Favorite photos'),
                    description: Text('The photo has been added to favourites'),
                    position: MotionToastPosition.center,
                    animationType: AnimationType.fromTop,
                    height: 100,
                    width: 300,
                  ).show(context);
                },
                label: Text(
                  "Add To Favorites",
                  style: GoogleFonts.abrilFatface(color: Colors.white),
                ),
                icon: const Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 255, 17, 0),
                ),
              )
            : OutlinedButton.icon(
                onPressed: () {
                  data.deleteF(image, context);
                  data.playAudioLove();
                },
                label: Text(
                  "Delete From Favorites",
                  style: GoogleFonts.abrilFatface(color: Colors.white),
                ),
                icon: const Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 0, 140, 255),
                ),
              ),
        IconButton(
            onPressed: () {
              data.saveImage(image, context);
            },
            icon: const Icon(
              Icons.download,
              color: Colors.white,
            )),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
