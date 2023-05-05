part of 'image_cubit.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageIndexChange extends ImageState {}

class ImageGetImageWiting extends ImageState {}

class ImageGetImageSuccess extends ImageState {}

class ImageGetImageError extends ImageState {}

class ImageSearchImageWiting extends ImageState {}

class ImageSearchImageSuccess extends ImageState {}

class ImageSearchImageError extends ImageState {}

class ImageFavoritesAddWiting extends ImageState {}

class ImageFavoritesAddSuccess extends ImageState {}

class ImageFavoritesAddError extends ImageState {}

class ImageFavoritesDeleteSuccess extends ImageState {}
