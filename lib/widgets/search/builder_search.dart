// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../functions/route.dart';
import '../../screens/photo_view.dart';

class BuilderSearch extends StatelessWidget {
  var data;
  BuilderSearch({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: .5),
      itemCount: data.searchModel.photos!.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            data.playAudioClick();
            MyRoute.goAndBack(
                context,
                MyPhotoView(
                  image: data.searchModel.photos![index].src!.medium!,
                  where: 2,
                ));
          },
          child: Image.network(
            data.searchModel.photos![index].src!.medium!,
            fit: BoxFit.cover,
          ),
        );
      },
    ));
  }
}
