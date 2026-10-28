// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_song_dao.dart';

// ignore_for_file: type=lint
mixin _$FavoriteSongDaoMixin on DatabaseAccessor<AppDatabase> {
  $FavoriteSongsTable get favoriteSongs => attachedDatabase.favoriteSongs;
  FavoriteSongDaoManager get managers => FavoriteSongDaoManager(this);
}

class FavoriteSongDaoManager {
  final _$FavoriteSongDaoMixin _db;
  FavoriteSongDaoManager(this._db);
  $$FavoriteSongsTableTableManager get favoriteSongs =>
      $$FavoriteSongsTableTableManager(_db.attachedDatabase, _db.favoriteSongs);
}
