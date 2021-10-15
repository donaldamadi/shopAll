import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shop_all/entry.dart';
import 'package:shop_all/entry_item.dart';

class GadgetPage extends StatefulWidget {
  @override
  _GadgetPageState createState() => _GadgetPageState();
}

class _GadgetPageState extends State<GadgetPage> {
  final webView = FlutterWebviewPlugin();
  TextEditingController searchController = TextEditingController();
  var items = List<Entry>();

  void filterSearchResults(String query) {
    List<Entry> dummySearchList = List<Entry>();
    dummySearchList.addAll(gadgetsData);
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
        items.addAll(gadgetsData);
      });
    }
  }

  @override
  void initState() {
    webView.close();
    items.addAll(gadgetsData);
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

 List<Entry> gadgetsData = <Entry>[
  Entry('Computer Village NG', 'https://computervillage.ng/', 'computer-village.png'),
  Entry('Slot', 'https://slot.ng', 'slot.png'),
  Entry('iStore', 'https://myistore.com.ng/', 'iStore.png'),
  Entry('Kara', 'https://kara.com.ng/', 'kara.png'),
  Entry('Just Fones', 'https://www.justfones.ng/', 'justfones.jpg'),
  Entry('Fair Price', 'http://fairprice.com.ng/', 'none.png'),
];
