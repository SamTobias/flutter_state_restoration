import 'package:flutter/material.dart';

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
