import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shop_all/entry.dart';
import 'package:shop_all/entry_item.dart';

class CarsPage extends StatefulWidget {
  @override
  _CarsPageState createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  final webView = FlutterWebviewPlugin();
  TextEditingController searchController = TextEditingController();
  var items = List<Entry>();

  void filterSearchResults(String query) {
  List<Entry> dummySearchList = List<Entry>();
  dummySearchList.addAll(carsData);
  if(query.isNotEmpty) {
    List<Entry> dummyListData = List<Entry>();
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
      items.addAll(carsData);
    });
  }
}

  @override
  void initState() {
    webView.close();
    items.addAll(carsData);
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
      appBar: AppBar(title: Text('Gadgets')),
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

const List<Entry> carsData = <Entry>[
  Entry('Cars45', 'https://www.cars45.com', 'none.png')
];