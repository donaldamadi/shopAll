import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shop_all/entry.dart';
import 'package:shop_all/entry_item.dart';

class BooksPage extends StatefulWidget {
  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final webView = FlutterWebviewPlugin();
  TextEditingController searchController = TextEditingController();
  var items = [];

  void filterSearchResults(String query) {
  List<Entry> dummySearchList = [];
  dummySearchList.addAll(booksData);
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
      items.addAll(booksData);
    });
  }
}

  @override
  void initState() {
    webView.close();
    items.addAll(booksData);
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
      appBar: AppBar(title: Text('Books')),
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

List<Entry> booksData = <Entry>[
  Entry('Comics', null, null, <Entry>[
    Entry('Amazon', 'https://www.amazon.com', 'amazon.png'),
  ]),
  Entry('Novels', null, null, <Entry>[
    Entry('PDF Drive', 'https://www.pdfdrive.com/', 'pdfdrive.png'),
  ]),
  Entry('African Literature', null, null, <Entry>[
    Entry('Jumia', 'https://www.jumia.com.ng', 'jumia.png'),
  ]),
];