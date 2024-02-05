import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            color: const Color.fromARGB(255, 195, 224, 237),
            child: ListTile(
              title: Text("Username:$index"),
              subtitle: Text("Mark Zuckerberg:$index"),
              leading: const CircleAvatar(
                radius: 20.0,
                child: Text("An"),
              ),
              trailing: Container(
                width: 150.0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit, color: Colors.blue)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete, color: Colors.red)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.list_alt_outlined, color: Colors.yellow)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
