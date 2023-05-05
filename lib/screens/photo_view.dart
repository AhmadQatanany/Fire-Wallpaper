import 'package:fireimage/widgets/photo_view/appbar_photoview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:fireimage/cubit/image_cubit.dart';
import 'package:fireimage/sql/sqflite.dart';

class MyPhotoView extends StatelessWidget {
  String image;
  int where;

  MyPhotoView({
    Key? key,
    required this.image,
    required this.where,
  }) : super(key: key);

  SqlDb sqlDb = SqlDb();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {      },
      builder: (context, state) {
        var data = ImageCubit().get(context);
        return Scaffold(
          
          //appbar photo view
          appBar:AppBarPhotoView(data: data, image: image, where: where, sqlDb: sqlDb) ,
         
          //body photo view
          body: PhotoView(
            imageProvider: NetworkImage(image),
          ),
        );
      },
    );
  }
}
