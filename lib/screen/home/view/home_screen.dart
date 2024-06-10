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
              actions: [],
              centerTitle: true,
            ),
            body: FutureBuilder(
              future: providerWH!.model,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  HomeModel? model = snapshot.data;
                  return Column(
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
                                providerRH!.bookmark!.add(txtSearch.text);
                              },
                              icon: const Icon(Icons.search),
                            ),
                          ],
                          controller: txtSearch,
                        ),
                      ),
                      Text("${model!.name}"),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("")
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
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
                        value: providerW!.themeMode,
                        onChanged: (value) {
                          SharedHelper helper = SharedHelper();
                          helper.setThemeData(value);
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
