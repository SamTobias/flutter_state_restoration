import 'package:flutter/material.dart';

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
