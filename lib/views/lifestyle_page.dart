import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shop_all/entry.dart';
import 'package:shop_all/entry_item.dart';

class LifeStylePage extends StatefulWidget {
  @override
  _LifeStylePageState createState() => _LifeStylePageState();
}

class _LifeStylePageState extends State<LifeStylePage> {
  final webView = FlutterWebviewPlugin();
  TextEditingController searchController = TextEditingController();
  var items = List<Entry>();

  void filterSearchResults(String query) {
  List<Entry> dummySearchList = List<Entry>();
  dummySearchList.addAll(lifestyleData);
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
      items.addAll(lifestyleData);
    });
  }
}

  @override
  void initState() {
    super.initState();
    items.addAll(lifestyleData);
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
      appBar: AppBar(title: Text('LifeStyle')),
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

const List<Entry> lifestyleData = <Entry>[
  Entry('FootWear', null, null, <Entry>[
    Entry('Amazon', 'https://www.amazon.com', 'amazon.png'),
    Entry('Keexs', 'https://keexs.com', 'keexs.png'),
    Entry('Bata Nigeria', 'https://batanigeria.com', 'bata-naija.jpg'),
    Entry('Ethnik', 'https://www.ethnik.com.ng/', 'ethnik.png'),
    Entry('Just Shoes', 'http://just-shoes.com/nigeria/', 'just-shoes.jpg'),
    Entry('Shoe Layers', 'https://www.shoelayers.com/', 'shoelayers.jpg'),
    Entry('Shoe Palace', 'https://www.shoepalace.com/', 'shoe-palace.png'),
    Entry('Flossy Shoes', 'https://flossyshoesnig.com/', 'flossy.jpg'),
    Entry('ShoeMiners', 'https://www.shoeminers.com/', 'shoeminers.jpg'),
    Entry('My Shoes NG', 'https://myshoes.ng/', 'myshoes.png'),
    Entry('TruShoe', 'https://trushoe.com/', 'trushoe.jpg'),
    Entry('Zappos', 'https://www.zappos.com/', 'zappos.png'),
    
  ]),
  Entry('Bags', null, null, <Entry>[
    Entry('Amazon', 'https://www.amazon.com', 'amazon.png'),
  ]),
  Entry('Sports Fit', null, null, <Entry>[
    Entry('Amazon', 'https://www.amazon.com', 'amazon.png'),
  ]),
  Entry('Accessories', null, null, <Entry>[
    Entry('Amazon', 'https://www.amazon.com', 'amazon.png'),
    Entry('Sojoee', 'https://www.sojoee.com/', 'sojoee.jpg'),
    Entry('Zashadu', 'https://www.zashadu.com', 'zashadu.png'),
    Entry('Judy\'s Jewelry Basket', 'https://www.judysjewelrybasket.com/', 'judyjewelry.jpg'),
  ]),
  Entry('ShapeWear', null, null, <Entry>[
    Entry('Amazon', 'https://www.amazon.com', 'amazon.png'),
  ]),
  Entry('Clothes', null, null, <Entry>[
    Entry('Amazon', 'https://www.amazon.com', 'amazon.png'),
  ]),
  Entry('Men\'s wear', null, null, <Entry>[
    Entry('Dex Stitches', 'https://dexstitches.com/men-fashion-shop-nigeria', 'dexstitches.jpg'),
    Entry('Obeezi', 'https://www.obeezi.com/', 'obeezi.png'),
  ]),
  Entry('Women\'s wear', null, null, <Entry>[
    Entry('PayPorte', 'https://payporte.com/', 'payporte.png'),
    Entry('The 5k Shop', 'https://the5kshop.com/', 'the5kshop.png'),
    Entry('Dex Stitches', 'https://dexstitches.com/women-fashion-store-nigeria', 'dexstitches.jpg'),
    Entry('Besaz Boutiques', 'https://www.besazboutique.com/', 'besaz.png'),
    Entry('The Outnet', 'https://www.theoutnet.com/en-us/', 'outnet.png'),
    Entry('Photino', 'https://www.photino.cn/', 'photino.png'),
  ]),
  Entry('Kiddies wear', null, null, <Entry>[
    Entry('Amazon', 'https://www.amazon.com', 'amazon.png'),
  ]),
  Entry('Skin & Hair care', null, null, <Entry>[
    Entry('Amazon', 'https://www.amazon.com', 'amazon.png'),
  ]),
  Entry('Hair', null, null, <Entry>[
    Entry('Amazon', 'https://www.amazon.com', 'amazon.png'),
  ]),
  Entry('General', null, null, <Entry>[
    Entry('Kulest', 'https://www.kulest.com.ng/', 'kulex.jpg'),
    Entry('LagMall', 'https://lagmall.com.ng/', 'lagmall.png'),
    Entry('Michael Kors', 'https://www.michaelkors.global/en_NG/', 'michael-kors.png'),
  ]),
];
