import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/nasa_data_provider.dart';
import '../widgets/nasa_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController _resultCountController = TextEditingController();
  int count = 10;
   
  @override
  void initState() {
    super.initState();
    Provider.of<NasaDataProvider>(context, listen: false).loadData(count: count);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Criado por Maycon Douglas'),
          duration: Duration(seconds: 5),
        ),
      );
    });

    return Consumer<NasaDataProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: Colors.grey[850],
          appBar: AppBar(
            title: const Text('Space Pictures'),
            titleTextStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            elevation: 16.0,
            centerTitle: true,
            backgroundColor: Colors.black87,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Número de resultados'),
                        content: TextField(
                          controller: _resultCountController,
                          keyboardType: TextInputType.number,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              int newCount =
                                  int.tryParse(_resultCountController.text) ?? 20;
                              if (newCount >= 1 && newCount <= 20) {
                                count = newCount;
                                provider.loadData(count: count);
                                Navigator.of(context).pop();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'O número de resultados deve estar entre 1 e 20',
                                    ),
                                  ),
                                );
                              }
                            },
                            child: const Text('Confirmar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.settings),
              ),
              IconButton(
                onPressed: () => provider.loadData(count: count),
                icon: const Icon(Icons.autorenew),
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () => provider.loadData(count: count),
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: provider.dataList.length,
              itemBuilder: (context, index) {
                final data = provider.dataList[index];
                return NasaCard(data: data);
              },
            ),
          ),
        );
      },
    );
  }
}
