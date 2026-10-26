import 'dart:convert';
import 'dart:io';

import 'package:easy_song/features/home/infrastructure/remote/song_dto.dart';
import 'package:http/http.dart' as http;

class SongApi {
  final String url =
      'https://songapi-fcbahjbha7dabkan.eastus-01.azurewebsites.net/api/songs';

  Future<List<SongDto>> getSongs() async {
    final Uri uri = Uri.parse(url);

    final http.Response response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List jsons = json['results'];

      return jsons.map((e) => SongDto.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load songs');
    }
  }
}
