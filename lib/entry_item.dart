import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_all/entry.dart';
import 'package:shop_all/views/shop_page.dart';

class EntryItem extends StatelessWidget {
  EntryItem(this.entry);
  final Entry entry;

  Widget buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return Builder(builder: (BuildContext context) {
        return GestureDetector(
          child: ListTile(
            title: Text(root.title),
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white54,
              child: Image.asset('assets/images/${root.asset}'),
              ),
          ),
          onTap: () {
            print(root.url);
            Provider.of<Data>(context, listen: false).changeUrl(root.url);
            Provider.of<Data>(context, listen: false).changeTitle(root.title);
            Provider.of<Data>(context, listen: false).changeLogo(root.asset);
            print(Provider.of<Data>(context, listen: false).url);
            Navigator.of(context).pushNamed('webView');
          },
        );
      });
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildTiles(entry);
  }
}
