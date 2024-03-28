import 'package:flutter/material.dart';
import 'package:my_app/widgets/app_bar.dart';
import 'package:my_app/screens/gallery.dart';
import 'package:my_app/screens/home_page.dart';
import 'package:my_app/screens/contact_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _selectedItem = 0;
  static const TextStyle customTextStyle =
      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  late TabController _controller;
  static const _pages = <Widget>[
    HomePageScreen(style: customTextStyle),
    ImagesPage(),
    ContactPageScreen(style: customTextStyle),
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
        onPressed: () {},
        // onPressed:() {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => const ImagesPage()),
        //   );
        // },
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.shopping_cart),
      ),
      body: Container(
        alignment: Alignment.center,
        child: TabBarView(
          controller: _controller,
          children: const [
            ..._pages, //spread operator, дозволяє додавати всі елементи з _pages до списку дочірніх елементів TabBarView, щоб кожен елемент _pages став окремою вкладкою у TabBarView.
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
