import 'package:flutter/material.dart';

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

class ListTab extends StatelessWidget {
  final List<String> items;

  const ListTab({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      // Add restorationId to a ListView to restore its scroll position
      restorationId: "card_list",
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }
}

class MainTab extends StatefulWidget {
  final int counter;

  const MainTab({Key? key, required this.counter}) : super(key: key);

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with RestorationMixin {
  final RestorableTextEditingController _textEditingController = RestorableTextEditingController();
  final RestorableBool _checked = RestorableBool(false);
  final RestorableString _text = RestorableString("");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                Text(
                  '${widget.counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              TextField(
                controller: _textEditingController.value,
                decoration: const InputDecoration(label: Text("Insert some text here")),
                onSubmitted: (String text) {
                  setState(() {
                    _text.value = text;
                  });
                },
              ),
              Text("Submitted text: ${_text.value}"),
              CheckboxListTile(
                title: const Text("Check me!"),
                value: _checked.value,
                onChanged: (checked) {
                  setState(() {
                    _checked.value = checked ?? false;
                  });
                },
              ),
            ]),
          ),
        ),
      ],
    );
  }

  @override
  String? get restorationId => "main_tab";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // Register properties that will be restored
    registerForRestoration(_checked, "checkbox");
    registerForRestoration(_text, "text");

    // Instead of below, you can just set restorationId on TextField
    registerForRestoration(_textEditingController, "text_field");
  }
}
