import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/nasa_data.dart';

class DetailsPage extends StatelessWidget {
  final NasaData data;

  const DetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              const Center(
                child: CircularProgressIndicator(),
              ),
              Hero(tag: data.date,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: data.url,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.date,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic
                  ),
                ),
                SizedBox(
                  // width: 300,
                  child: Text(
                    "© ${data.copyright}",
                    softWrap: true,
                    // textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: Text(
              data.explanation,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
