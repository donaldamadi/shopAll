import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shop_all/entry.dart';
import 'package:shop_all/favorite_model.dart';
import 'package:shop_all/views/shop_page.dart';

class EntryItem extends StatefulWidget {
  EntryItem(this.entry);
  final Entry entry;

  @override
  _EntryItemState createState() => _EntryItemState();
}

class _EntryItemState extends State<EntryItem> {
  Widget buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return Builder(builder: (BuildContext context) {
        var favoriteDB = Provider.of<Data>(context, listen: false);

        return GestureDetector(
          child: ListTile(
            trailing: IconButton(
              icon: Icon(root.saved ? Icons.favorite : Icons.favorite_border),
              color: root.saved ? Colors.red : null,
              onPressed: () async{
                setState(() {
                  Provider.of<Data>(context, listen: false).changeUrl(root.url);
            Provider.of<Data>(context, listen: false).changeTitle(root.title);
            Provider.of<Data>(context, listen: false).changeLogo(root.asset);
                  root.saved = !root.saved;
                });
                  if(root.saved = true) {
                    await favoriteDB.addItem(Favorite(
                      logo: favoriteDB.logo,
                      name: favoriteDB.title,
                      url: favoriteDB.url,
                      isFavorited: true,
                    ));
                  } else {
                    
                  }
              },
            ),
            title: Text(root.title),
            leading: CircleAvatar(
              backgroundColor: Colors.white54,
              radius: 25,
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
    return buildTiles(widget.entry);
  }
}

class Data extends ChangeNotifier {
  String? url = 'https://www.google.com';
  String title = 'WebView';
  String? logo = 'none.png';
  bool saved = true;

  void changeUrl(String? newString) {
    url = newString;
    notifyListeners();
  }

  void changeTitle(String newString) {
    title = newString;
    notifyListeners();
  }

  void changeLogo(String? newString) {
    logo = newString;
    notifyListeners();
  }

  void changeSaved(bool newSaved) {
    newSaved = !newSaved;
    notifyListeners();
  }

  addItem(Favorite item) async {
    var box = await Hive.openBox<Favorite>('favorites');

    box.add(item);

    notifyListeners();
  }
}
