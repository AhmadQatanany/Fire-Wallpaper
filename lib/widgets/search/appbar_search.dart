// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarSearch extends StatelessWidget implements PreferredSizeWidget {
  var text;
  var data;
  AppBarSearch({
    Key? key,
    required this.text,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySearchBar(
              backgroundColor: Colors.black,
              title: Row(
                children: [
                  Text(
                    "Fire",
                    style: GoogleFonts.pacifico(
                        color: Color.fromARGB(255, 0, 140, 255), fontSize: 22),
                  ),
                  Text(
                    "Wallpaper",
                    style: GoogleFonts.pacifico(
                        color: Color.fromARGB(255, 255, 17, 0), fontSize: 22),
                  ),
                ],
              ),
              foregroundColor: Colors.white,
              searchCursorColor: Colors.white,
              searchBackgroundColor: Colors.black,
              searchTextStyle: GoogleFonts.abrilFatface(color: Colors.white),
              onSearch: (value) {
                text.text = value;
                data.searchImage(text.text);
                if (value.length == 0) {
                  data.searchList.clear();
                }
              });
  }
  
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
