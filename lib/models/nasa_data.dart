class NasaData {
  final String copyright;
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String title;
  final String url;
  final String serviceVersion;
  String imgDefault = 
  "https://media.licdn.com/dms/image/D4E22AQEx76VV55Adzw/feedshare-shrink_800/0/1687878193317?e=1691020800&v=beta&t=hSp1VMfSrjENKDfR8bqRr83HPxfp5coUM1gAChRrEW4";
  
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
      url: data['url'] ?? 'imgDefault',
      serviceVersion: data['service_version'] ?? '',
    );
  }
}
