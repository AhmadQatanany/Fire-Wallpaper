import 'dart:math';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:fireimage/helpers/dio.dart';
import 'package:fireimage/models/search_model.dart';
import 'package:fireimage/screens/favorites.dart';
import 'package:fireimage/screens/home.dart';
import 'package:fireimage/screens/search.dart';
import 'package:fireimage/sql/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:meta/meta.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:sqflite/sqflite.dart';

import '../models/image_image.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());
  ImageCubit get(context) => BlocProvider.of(context);

  //Bottom Navigation Bar
  int index = 0;
  List<BottomNavigationBarItem> item = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
        ),
        label: "Search"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
        ),
        label: "Favorites"),
  ];
 
  //change index
  changeIndex(int index) {
    this.index = index;
    playAudioClick();
    emit(ImageIndexChange());
  }

  //list page
  List<Widget> pageindex = [
    HomePage(),
    Search(),
    Favorites(),
  ];

  //get image
  ImageModel imageModel = ImageModel();
  int page = 1;
  getImage() async {
    emit(ImageGetImageWiting());
    DioHelper.getData(page).then((value) {
      //print(value.data);
      imageModel = ImageModel.fromJson(value.data);

      print(imageModel.photos![3].liked);
      emit(ImageGetImageSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(ImageGetImageError());
    });
  }

  //search data
  List searchList = [];
  SearchModel searchModel = SearchModel();
  searchImage(String text) {
    emit(ImageSearchImageWiting());
    DioHelper.searchData(text).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      searchList.add(value.data);
      print(searchModel.photos![0].src!.large!);
      emit(ImageSearchImageSuccess());
    }).catchError((error) {
      emit(ImageSearchImageSuccess());
    });
  }

  //save image 
  saveImage(imagePath, context) async {
    var response = await Dio()
        .get(imagePath, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "${Random().nextInt(999999999)}صور دينية");
    MotionToast.success(
      title: Text("Save Image"),
      layoutOrientation: ToastOrientation.rtl,
      description: Text("The image has been saved successfully"),
    ).show(context);
    playAudioDownlode();
  }

  //save image to mysqflite
  SqlDb sqlDb = SqlDb();
  List imagesFaborites = [];
  Set imageF = {};
  selectData() async {
    emit(ImageFavoritesAddWiting());
    sqlDb.readData('SELECT * FROM images').then((v) {
      imagesFaborites.clear();
      imageF.clear();
      v.forEach((element) {
        imageF.add(element["url"]);
        imagesFaborites = imageF.toList();

        emit(ImageFavoritesAddSuccess());
      });
      emit(ImageFavoritesAddSuccess());
      print(imagesFaborites);
    }).catchError((error) {
      emit(ImageFavoritesAddError());
    });
  }

  //delet image from mysqflite 
  deleteF(image, context) {
    sqlDb.deleteData('DELETE FROM images WHERE url = "${image}"').then((v) {
      selectData();
      if (v > 0) {
        imagesFaborites.removeWhere((element) => element == image);
        Navigator.pop(context);
        MotionToast.delete(
                title: Text("Deleted"),
                description: Text("The item is deleted"))
            .show(context);
        emit(ImageFavoritesDeleteSuccess());
      }
    });
  }

  //audio function
  late AudioCache audioCache;
  AudioPlayer audioPlayer = AudioPlayer();
  initAudio() {
    audioCache = AudioCache(fixedPlayer: audioPlayer);
  }

  playAudioClick() {
    audioCache.play("audios/mixkit-fast-double-click-on-mouse-275.wav");
  }

  playAudioLove() {
    audioCache.play(
        "audios/short-success-sound-glockenspiel-treasure-video-game-6346.mp3");
  }

  playAudioDownlode() {
    audioCache.play("audios/camera-shutter-6305.mp3");
  }
}
