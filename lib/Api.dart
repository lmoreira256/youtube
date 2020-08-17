import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/models/Video.dart';

const CHAVE_YOUTUBE_API = 'AIzaSyBb6ef8Kg6w6x9GK9fsenKWe0NbFXQN9m8';
const CHANNEL_ID = 'UCK-QxdEXMOEj4RQALhFpUcQ';
const URL_BASE = 'https://www.googleapis.com/youtube/v3/';

class Api {
  Future<List<Video>> search(String search) async {
    http.Response response = await http.get(URL_BASE +
        'search'
            '?part=snippet'
            '&type=video'
            '&maxResults=20'
            '&order=date'
            '&key=$CHAVE_YOUTUBE_API'
            '&channelId=$CHANNEL_ID'
            '&q=$search');

    if (response.statusCode == 200) {
      Map<String, dynamic> dataJson = json.decode(response.body);

      List<Video> videos = dataJson['items'].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    }
  }
}
