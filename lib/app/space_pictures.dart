import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_pictures_2/models/nasa_data.dart';
import 'package:space_pictures_2/pages/details_page.dart';

import '../pages/home_page.dart';
import '../providers/nasa_data_provider.dart';
import '../routes/app_route.dart';

class SpacePicturesApp extends StatelessWidget {
  const SpacePicturesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Space Pictures',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => NasaDataProvider(),
        child: const HomePage(),
      ),
      routes: {
        AppRoute.details.name: (context) {
          final data = ModalRoute.of(context)?.settings.arguments as NasaData?;
          return DetailsPage(
            data: data!,
          );
        },
      },
    );
  }
}
