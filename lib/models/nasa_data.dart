class NasaData {
  final String copyright;
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String title;
  final String url;
  final String serviceVersion;

  NasaData({
    required this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.title,
    required this.url,
    required this.serviceVersion,
  });

  factory NasaData.fromJson(Map<String, dynamic> data) {
    return NasaData(
      copyright: data['copyright'] ?? 'no-copyright',
      date: data['date'] ?? '',
      explanation: data['explanation'] ?? '',
      hdurl: data['hdurl'] ?? '',
      mediaType: data['media_type'] ?? '',
      title: data['title'] ?? '',
      url: data['url'] ?? '',
      serviceVersion: data['service_version'] ?? '',
    );
  }
}
