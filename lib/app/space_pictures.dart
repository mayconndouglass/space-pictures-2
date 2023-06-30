import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/home_page.dart';
import '../providers/nasa_data_provider.dart';

class SpacePicturesApp extends StatelessWidget {
  const SpacePicturesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NasaDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Space Pictures',
        theme: ThemeData(
        colorSchemeSeed: Colors.black87,
      ),
        home: const HomePage(),
      ),
    );
  }
}