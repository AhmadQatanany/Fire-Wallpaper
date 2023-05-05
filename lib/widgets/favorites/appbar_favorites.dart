import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarFavorites extends StatelessWidget implements PreferredSizeWidget {
  const AppBarFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: Padding(
        padding: const EdgeInsets.only(left: 1),
        child: Row(children: [
          const Icon(
            Icons.favorite,
            color: Color.fromARGB(255, 255, 17, 0),
          ),
          Expanded(
            child: Text("Page",
                style: GoogleFonts.abrilFatface(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 255, 255, 255))),
          ),
        ]),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    "Fire",
                    style: GoogleFonts.pacifico(
                        color: const Color.fromARGB(255, 0, 140, 255),
                        fontSize: 22),
                  ),
                  Text(
                    "Wallpaper",
                    style: GoogleFonts.pacifico(
                        color: const Color.fromARGB(255, 255, 17, 0),
                        fontSize: 22),
                  ),
                ],
              )),
        )
      ],
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
