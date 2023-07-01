import 'package:flutter/material.dart';
import 'package:space_pictures_2/models/nasa_data.dart';
import '../routes/app_route.dart';

class NasaCard extends StatelessWidget {
  final NasaData data;

  const NasaCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 16.0,
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
      color: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              const Positioned.fill(
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 255, 117, 0)),
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                width: 500,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.zero, top: Radius.circular(12.0)),
                  child: Image.network(
                    data.url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Hero(
                tag: data.date,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.details.name, arguments: data);
                    },
                    child: const SizedBox(
                      height: 250,
                      width: 500,
                      child: SizedBox(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data.date,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
