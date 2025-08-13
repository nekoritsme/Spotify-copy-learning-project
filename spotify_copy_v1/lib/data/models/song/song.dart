import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_copy_v1/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;
  bool? isFavorite;
  String? songId;

  SongModel(
      {required this.isFavorite,
      required this.title,
      required this.artist,
      required this.duration,
      required this.releaseDate,
      required this.songId});

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data["title"];
    artist = data["artist"];
    duration = data["duration"];
    releaseDate = data["releaseDate"];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
        title: title!,
        artist: artist!,
        duration: duration!,
        releaseDate: releaseDate!,
        isFavorite: isFavorite!,
        songId: songId!);
  }
}
