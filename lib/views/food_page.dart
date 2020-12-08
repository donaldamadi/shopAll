import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shop_all/entry.dart';
import 'package:shop_all/entry_item.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final webView = FlutterWebviewPlugin();
  TextEditingController searchController = TextEditingController();
  var items = List<Entry>();

  void filterSearchResults(String query) {
    List<Entry> dummySearchList = List<Entry>();
    dummySearchList.addAll(foodData);
    if (query.isNotEmpty) {
      List<Entry> dummyListData = List<Entry>();
      dummySearchList.forEach((item) {
        if (item.title.contains(query)) {
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
        items.addAll(foodData);
      });
    }
  }

  @override
  void initState() {
    webView.close();
    items.addAll(foodData);
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
      appBar: AppBar(title: Text('Food')),
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

const List<Entry> foodData = <Entry>[
  Entry('Food', null, null, <Entry>[
    Entry('Amazon', 'https://www.amazon.com', 'amazon.png'),
  ]),
  Entry('Groceries', null, null, <Entry>[
    Entry('Market Square', 'https://marketsquareng.com/', 'market-square.png'),
    Entry('The Market Food Shop', 'https://www.themarketfoodshop.com/', 'market-foodshop.jpg'),
    Entry('Supermart.ng', 'https://www.supermart.ng/', 'supermart.png'),
    Entry('Food Locker', 'https://www.foodlocker.com.ng/', 'foodlocker.png'),
    Entry('Price Pally', 'https://pricepally.com/', 'pricepally.png'),
    Entry('Mile 12 Market', 'https://mile12market.com/', 'mile12market.png'),
    Entry('Apple Cart', 'https://www.applecartng.com/', 'applecart.jpg'),
  ]),
];
