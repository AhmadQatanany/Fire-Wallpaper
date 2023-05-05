// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../functions/route.dart';
import '../../screens/photo_view.dart';

class BuilderHomePage extends StatelessWidget {
  var data;
  BuilderHomePage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .5),
            itemCount: data.imageModel.photos!.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    data.playAudioClick();
                    MyRoute.goAndBack(
                        context,
                        MyPhotoView(
                          image: data.imageModel.photos![index].src!.large!,
                          where: 1,
                        ));
                  },
                  child: FadeInImage.assetNetwork(
                      placeholder: "assets/images/115242-image-loader.gif",
                      fit: BoxFit.cover,
                      image: data.imageModel.photos![index].src!.medium!));
            },
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      if (data.imageModel.nextPage != null) {
                        data.page++;
                        data.getImage();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 17, 0)),
                    child: Text(
                      "Next Page",
                      style: GoogleFonts.abrilFatface(color: Colors.white),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 33,
          )
        ],
      ),
    );
  }
}
