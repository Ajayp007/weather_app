import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    providerR = context.read<ThemeProvider>();
    providerW = context.watch<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'location');
            },
            icon: const Icon(Icons.add),
          ),
        ],
        centerTitle: true,
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
                trailing:  Switch(
                  value: providerW!.themeMode,
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
                onTap: () {},
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
