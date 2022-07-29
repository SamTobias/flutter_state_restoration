import 'package:flutter/material.dart';
import 'package:flutter_state_restoration/src/list_tab.dart';
import 'package:flutter_state_restoration/src/main_tab.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with RestorationMixin {
  final RestorableInt _counter = RestorableInt(0);
  final RestorableInt _selectedIndex = RestorableInt(0);
  final List<String> items = List<String>.generate(10000, (i) => 'Item $i');

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex.value = index;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter.value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(widget.title);
          return false;
        },
        child: [
          MainTab(counter: _counter.value),
          ListTab(items: items),
        ].elementAt(_selectedIndex.value),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Main"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "List")
        ],
        currentIndex: _selectedIndex.value,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  String? get restorationId => "second_page";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // Register properties that will be restored
    registerForRestoration(_counter, "counter");
    registerForRestoration(_selectedIndex, "tab_index");
  }
}
