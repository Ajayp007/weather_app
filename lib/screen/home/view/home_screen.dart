import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screen/home/model/home_model.dart';
import 'package:weather_app/screen/home/provider/home_provider.dart';
import 'package:weather_app/screen/internet/no_internet.dart';

import '../../../utils/shared_helper.dart';
import '../../../utils/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ThemeProvider? providerR;
  ThemeProvider? providerW;
  TextEditingController txtSearch = TextEditingController();
  HomeProvider? providerWH;
  HomeProvider? providerRH;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().checkConnection();
    context.read<HomeProvider>().getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ThemeProvider>();
    providerW = context.watch<ThemeProvider>();
    providerWH = context.watch<HomeProvider>();
    providerRH = context.read<HomeProvider>();
    return providerWH!.isInternet == false
        ? const NoInternet()
        : Scaffold(
            appBar: AppBar(
              title: const Text("Weather"),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    providerRH!.bookmark!.add(txtSearch.text);

                  },
                  icon: const Icon(Icons.bookmark_add_outlined),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: providerWH!.model,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      HomeModel? model = snapshot.data;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: SearchBar(
                              hintText: "Search",
                              textInputAction: TextInputAction.search,
                              keyboardType: TextInputType.text,
                              trailing: [
                                IconButton(
                                  onPressed: () {
                                    providerWH!.search(txtSearch.text);
                                  },
                                  icon: const Icon(Icons.search),
                                ),
                              ],
                              controller: txtSearch,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 350,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://img.freepik.com/premium-vector/too-hot-summer-character-heat-stroke-high-temperature-warning-hot-summer-day-vector_432516-2737.jpg"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Text(
                            "${model!.name}",
                            style: const TextStyle(fontSize: 28),
                          ),
                          Text(
                            "${model.weather![0].description}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${model.mainModel!.temp}°",
                                style: const TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              Text("H:${model.mainModel!.humidity}°"),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: InkWell(  onTap: (){},
                              child: Container(
                                height: 70,
                                alignment: Alignment.center,
                                width: MediaQuery.sizeOf(context).width*0.9,
                                decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(12),),
                                child: const Text("More About ->"),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
            drawer: Drawer(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Image.network(
                      "https://cdn-icons-png.flaticon.com/512/10127/10127236.png",
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      leading: const Icon(Icons.home_outlined),
                      title: const Text("Home"),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.light_mode_outlined),
                      title: const Text("ThemeMode"),
                      trailing: Switch(
                        value: providerW!.themeMode!,
                        onChanged: (value) {
                          setThemeData(value);
                          providerR!.setTheme();
                        },
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, 'location');
                      },
                      leading: const Icon(Icons.bookmark_border_outlined),
                      title: const Text("Bookmark"),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.share_outlined),
                      title: const Text("Share"),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
