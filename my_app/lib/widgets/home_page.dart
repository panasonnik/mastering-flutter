import 'package:flutter/material.dart';
import 'package:my_app/widgets/app_bar.dart';
import 'package:my_app/screens/gallery.dart';
import 'package:my_app/screens/home_page.dart';
import 'package:my_app/screens/contact_page.dart';
import 'package:my_app/screens/cart_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _selectedItem = 0;
  int _totalItems = 0;
  int key = 1;
  late final Map<int, Map<String, dynamic>> items = {};

  void addItem() {
    setState(() {
      _totalItems++;
    });
  }

  void saveItem(String title) {
    setState(() {
      final existingItem = items.entries.firstWhere(
        (entry) => entry.value['title'] == title,
        orElse: () => const MapEntry(-1, {}),
      );
      if (existingItem.key != -1) {
        items[existingItem.key]!['count']++;
      } else {
        items[key] = {'title': title, 'count': 1};
        key++;
      }
    });
  }

  static const TextStyle customTextStyle =
      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  late TabController _controller;
  late List<Widget> _pages;
  @override
  void initState() {
    _pages = [
      const HomePageScreen(style: customTextStyle),
      ImagesPage(
        addItemFunction: addItem,
        saveItemFunction: saveItem,
      ),
      const ContactPageScreen(style: customTextStyle),
    ];
    super.initState();
    _controller = TabController(vsync: this, length: _pages.length);

    _controller.addListener(() {
      setState(() {
        _selectedItem = _controller.index;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
      appBar: const MyAppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange[100],
              ),
              child: const Text("Navigation"),
            ),
            ListTile(
              title: const Text("Home"),
              selected: _selectedItem == 0,
              selectedTileColor: Colors.deepOrange,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Shop"),
              selected: _selectedItem == 1,
              selectedTileColor: Colors.deepOrange,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Contact"),
              selected: _selectedItem == 2,
              selectedTileColor: Colors.deepOrange,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CartPage(style: customTextStyle, items: items),
                ),
              );
            },
            backgroundColor: Colors.deepOrange,
            child: const Icon(Icons.shopping_cart),
          ),
          Positioned(
            top: 32,
            left: 34,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                "$_totalItems",
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 10.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: TabBarView(
          controller: _controller,
          children: [
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
            icon: Icon(Icons.shopping_bag),
            label: "Shop",
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
