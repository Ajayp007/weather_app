import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose City"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              leading: const Icon(Icons.search),
              padding: WidgetStateProperty.all(
                const EdgeInsets.only(left: 20),
              ),
              hintText: "Search a new City",
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "My Cities",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
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
                        const Text("City name"),
                        const Spacer(),
                        const Text(
                          "25°",
                          style: TextStyle(
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
      ),
    );
  }
}
