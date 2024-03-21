import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const myTitle = "Task 4";

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: myTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _selectedItem = 0;
  late TabController _controller;
  static const _pages = <Widget>[
    Text('Home Page'),
    Text('About Page'),
    Text('Contact Page'),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: _pages.length);

    _controller.addListener(() {
      setState(() {
        _selectedItem = _controller.index;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
      _controller.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TEXT"),
        backgroundColor: Colors.deepOrange,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.phone),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange[100],
              ),
              child: const Text("Navigation"),
            ),
            const ListTile(
              title: Text("Home"),
            ),
            const ListTile(
              title: Text("About"),
            ),
            const ListTile(
              title: Text("Contact"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ImagesPage()),
          );
        },
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.photo),
      ),
      body: Container(
        alignment: Alignment.center,
        child: TabBarView(
          controller: _controller,
          children: const [
            ..._pages,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "About",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: "Contact",
          ),
        ],
        selectedItemColor: Colors.deepOrange,
        onTap: _onItemTapped,
        currentIndex: _selectedItem,
      ),
    );
  }
}

class ImagesPage extends StatefulWidget {
  const ImagesPage({super.key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("IMAGES"),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ],
      ),
    );
  }
}
