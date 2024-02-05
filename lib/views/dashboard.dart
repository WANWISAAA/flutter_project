import 'package:flutter/material.dart';
import 'package:flutter_miniproject/views/about.dart';
import 'package:flutter_miniproject/views/home.dart';
import 'package:flutter_miniproject/views/profile.dart';
import 'package:http/http.dart' as http;

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({super.key, required this.title});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List _listdata = [];
  // =============Read Data==============
  Future<void> ReadData() async {
    const url = "http://192.168.1.104/crud-api/controllers/readData.php";
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      debugPrint(res.body);
    }
  }

  @override
  void initState() {
    ReadData();
    super.initState();
  }
  late final String titleMenu;
  late final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.title),
      ),
       drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Elon Musk"),
              accountEmail: Text("elon@gmail.com"),
              currentAccountPicture: CircleAvatar(
                // child: Icon(Icons.android),
                backgroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/0/08/Elon_Musk_at_a_Press_Conference.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text("Home Page"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DashboardPage(title: "Dashboard Page"),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.app_blocking),
              title: const Text("Profile Page"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ProfilePage(title: "Profile Page"),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.key),
              title: const Text("About Page"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(title: "About Page"),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.radar),
              title: const Text("Dashboard Page"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DashboardPage(title: "Dashboard Page"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          children: [
            CardWidget(
              titleMenu: "REATful API",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(title: "REATful API"),
                  ),
                );
              },
            ),
            CardWidget(
              titleMenu: "About Page",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(title: "About Page"),
                  ),
                );
              },
            ),
            CardWidget(
              titleMenu: "Profile Page",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ProfilePage(title: "Profile Page"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget CardWidget(
      {required String titleMenu, required GestureTapCallback onTap}) {
    return Card(
      elevation: 20.0,
      color: Colors.lightBlueAccent,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            titleMenu,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
