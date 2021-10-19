import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shop_all/entry.dart';
import 'package:shop_all/entry_item.dart';

class AppliancesPage extends StatefulWidget {
  @override
  _AppliancesPageState createState() => _AppliancesPageState();
}

class _AppliancesPageState extends State<AppliancesPage> {
  final webView = FlutterWebviewPlugin();
  TextEditingController searchController = TextEditingController();
  var items = [];

  void filterSearchResults(String query) {
    List<Entry> dummySearchList = [];
    dummySearchList.addAll(appliancesData);
    if (query.isNotEmpty) {
      List<Entry> dummyListData = [];
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
        items.addAll(appliancesData);
      });
    }
  }

  @override
  void initState() {
    webView.close();
    items.addAll(appliancesData);
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
      appBar: AppBar(title: Text('Appliances')),
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

List<Entry> appliancesData = <Entry>[
  Entry('Alabamart', 'https://www.alabamart.com', 'none.png')
];
