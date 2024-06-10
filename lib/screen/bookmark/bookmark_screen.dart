import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screen/home/model/home_model.dart';

import '../home/provider/home_provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {

  HomeProvider? providerW;
  HomeProvider? providerR;
  HomeModel? model;

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose City"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: providerW!.model,
        builder: (context, snapshot) {
          model = snapshot.data;
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "My Cities",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: providerW!.bookmark!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 90,
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                               Text("${providerR!.bookmark![index]}"),
                              const Spacer(),
                               Text(
                                "${model!.mainModel!.temp}°",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Image.network(
                                "https://cdn-icons-png.freepik.com/512/1779/1779940.png",
                                fit: BoxFit.cover,
                                height: 50,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
