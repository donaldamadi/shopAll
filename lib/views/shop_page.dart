import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shop_all/entry.dart';
import 'package:shop_all/entry_item.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final webView = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    webView.close();
  }

  @override
  void dispose() {
    webView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop All'),
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(content: Text('Tap back again to leave.')),
        child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) =>
                          EntryItem(data[index]),
                      itemCount: data.length,
                    ),
                  ),
                )
              ],
            ))),
      ),
    );
  }
}

const List<Entry> data = <Entry>[
  Entry('Foreign', null, null, <Entry>[
    Entry('Amazon', 'https://www.amazon.com', 'amazon.png'),
    Entry('Ali Express', 'https://www.aliexpress.com', 'ali-express.png'),
    Entry('Wish', 'https://www.wish.com', 'none.png'),
  ]),
  Entry('Nigerian', null, null, <Entry>[
    Entry('Jumia', 'https://www.jumia.com.ng', 'jumia.png'),
    Entry('Konga', 'https://www.konga.com', 'konga.png'),
    Entry('Jiji', 'https://www.jiji.ng', 'jiji.png'),
  ])
];

class Data extends ChangeNotifier {
  String url = 'https://www.google.com';
  String title = 'WebView';
  String logo = 'none.png';

  void changeUrl(String newString) {
    url = newString;
    notifyListeners();
  }

  void changeTitle(String newString) {
    title = newString;
    notifyListeners();
  }

  void changeLogo(String newString) {
    logo = newString;
    notifyListeners();
  }
}
