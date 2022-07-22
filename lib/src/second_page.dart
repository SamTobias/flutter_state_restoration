import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with RestorationMixin {
  final RestorableInt _counter = RestorableInt(0);
  final RestorableTextEditingController _textEditingController = RestorableTextEditingController();
  final RestorableBool _checked = RestorableBool(false);

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
        child: ListView(
          restorationId: "card_list",

          /// Restore scroll position
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${_counter.value}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                  TextField(
                    controller: _textEditingController.value,
                    decoration: const InputDecoration(
                      label: Text("Insert some text here")
                    ),
                  ),
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
            )
          ],
        ),
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
    /// Register properties that will be restored
    registerForRestoration(_counter, "counter");
    registerForRestoration(_textEditingController, "text_field");
    registerForRestoration(_checked, "checkbox");
  }
}
