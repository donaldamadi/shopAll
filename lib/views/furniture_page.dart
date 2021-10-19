import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shop_all/entry.dart';
import 'package:shop_all/entry_item.dart';

class FurniturePage extends StatefulWidget {
  @override
  _FurniturePageState createState() => _FurniturePageState();
}

class _FurniturePageState extends State<FurniturePage> {
  final webView = FlutterWebviewPlugin();
  TextEditingController searchController = TextEditingController();
  var items = [];

  void filterSearchResults(String query) {
  List<Entry> dummySearchList = [];
  dummySearchList.addAll(furnitureData);
  if(query.isNotEmpty) {
    List<Entry> dummyListData = [];
    dummySearchList.forEach((item) {
      if(item.title.contains(query)) {
        dummyListData.add(item);
      }
      item.children.forEach((element) {
          if(element.title.contains(query)){
            dummyListData.add(element);
          }
        });
    });
    setState(() {
      items.clear();
      items.addAll(dummyListData);
    });
    return;
  } else {
    setState(() {
      items.clear();
      items.addAll(furnitureData);
    });
  }
}

  @override
  void initState() {
    webView.close();
    items.addAll(furnitureData);
    super.initState();
  }

  @override
  void dispose() {
    webView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Furniture')),
      body: Container(
          child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  controller: searchController,
                  decoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25)))))),
          Expanded(
            child: ListView.builder(
              // shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return EntryItem(items[index]);
              },
              itemCount: items.length,
            ),
          )
        ],
      )),
    );
  }
}

List<Entry> furnitureData = <Entry>[
  Entry('WayFair', 'https://www.wayfair.com/furniture/cat/furniture-c45974.html', 'wayfair.jpg'),
  Entry('Red Violet', 'https://www.redviolet.com.ng/', 'redviolet.png'),
  Entry('Office Everything', 'https://www.officeeverything.com.ng/', 'office-everything.jpg'),
  Entry('Winnyz Interiors', 'https://www.winnyzinteriors.com/', 'winnyz.jpg'),
  Entry('McGankons Furniture', 'https://mcgankons.com/', 'mcgankons.png'),
  Entry('Overstock', 'https://www.overstock.com/', 'overstock.png'),
  Entry('Burrow', 'https://burrow.com/', 'burrow.png'),
  Entry('Large Life Designs', 'https://www.largelifedesigns.com/', 'largelifedesigns.png'),
  Entry('Furnish.ng', 'https://www.furnish.ng/', 'furnish.png'),
  Entry('Floyd', 'https://floydhome.com/', 'floyd.png'),
];