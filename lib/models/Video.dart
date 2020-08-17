class Video {
  String id;
  String title;
  String description;
  String thumbnail;
  String channel;

  Video({this.id, this.title, this.description, this.thumbnail, this.channel});

  static convertJson(Map<String, dynamic> json) {
    return Video(
        id: json['id']['videoId'],
        title: json['snippet']['title'],
        description: json['snippet']['description'],
        thumbnail: json['snippet']['thumbnails']['high']['url'],
        channel: json['snippet']['channelId']);
  }

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        id: json['id']['videoId'],
        title: json['snippet']['title'],
        description: json['snippet']['description'],
        thumbnail: json['snippet']['thumbnails']['high']['url'],
        channel: json['snippet']['channelId']);
  }
}
