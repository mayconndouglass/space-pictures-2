import 'package:flutter/material.dart';
import 'package:space_pictures_2/models/nasa_data.dart';

import '../pages/details_page.dart';

class NasaCard extends StatelessWidget {
  final NasaData data;

  const NasaCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 16.0,
      margin: const EdgeInsets.all(12.0),
      color: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              const SizedBox(
                /* width: 400, */
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                ),
              ),
              Hero(
                tag: data.date,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(data: data),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 300,
                    width: 500,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(bottom: Radius.zero, top: Radius.circular(12.0)),
                      child: Image.network(
                        data.url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: 
            Text(
              data.title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
            data.date,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          )
          )
        ],
      ),
    );
  }
}
