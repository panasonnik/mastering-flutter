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

  addItem() {
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
        // If the title doesn't exist, add a new entry with count initialized to 1
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
              selectedColor: Colors.deepOrange,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Shop"),
              selected: _selectedItem == 1,
              selectedColor: Colors.deepOrange,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Contact"),
              selected: _selectedItem == 2,
              selectedColor: Colors.deepOrange,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CartPage(style: customTextStyle, items: items)),
          );
        },
        backgroundColor: Colors.deepOrange,
        child: Stack(
          children: [
            const Icon(Icons.shopping_cart),
            const Positioned(
              top: 10.5,
              left: 10.5,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 7.0,
              ),
            ),
            Positioned(
              top: 9,
              left: 14,
              child: Text(
                "$_totalItems",
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 10.0,
                ),
              ),
            ),
          ],
        ),
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
