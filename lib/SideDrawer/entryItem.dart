import 'package:flutter/material.dart';
import './entry.dart';

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      initiallyExpanded: true,
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
