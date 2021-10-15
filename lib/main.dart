import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shop_all/entry.dart';
import 'package:shop_all/entry_item.dart';
import 'package:shop_all/favorite_model.dart';
import 'package:shop_all/views/appliances_page.dart';
import 'package:shop_all/views/books_page.dart';
import 'package:shop_all/views/cars_page.dart';
import 'package:shop_all/views/food_page.dart';
import 'package:shop_all/views/furniture_page.dart';
import 'package:shop_all/views/gadgets_page.dart';
import 'package:shop_all/views/grid_page.dart';
import 'views/lifestyle_page.dart';
import 'package:shop_all/views/realestate_page.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:hive/hive.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(FavoriteAdapter());

  runApp(MyApp());
}

final FlutterWebviewPlugin webviewPlugin = new FlutterWebviewPlugin();
const List<Entry> favoriteData = <Entry>[];



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
        create: (context) => Data(),
        builder: (context, _) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primaryColor: Colors.white,
              ),
              // home: ShopPage(),
              routes: <String, WidgetBuilder>{
                '/': (_) => GridPage(),
                '/lifestyle': (_) => LifeStylePage(),
                '/gadgets': (_) => GadgetPage(),
                '/food': (_) => FoodPage(),
                '/books': (_) => BooksPage(),
                '/appliances': (_) => AppliancesPage(),
                '/cars': (_) => CarsPage(),
                '/furniture': (_) => FurniturePage(),
                '/realEstate': (_) => RealEstatePage(),
                'webView': (context) => WebviewScaffold(
                      url: Provider.of<Data>(context).url,
                      appBar: AppBar(
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/${Provider.of<Data>(context).logo}",
                          ),
                        ),
                        title: Text(Provider.of<Data>(context).title),
                        automaticallyImplyLeading: false,
                        actions: [
                          IconButton(
                            icon: Icon(
                              Icons.close,
                            ),
                            onPressed: () {
                              webviewPlugin.hide();
                              return showDialog<void>(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Back?'),
                                      content: Text('Go Back to main Page?'),
                                      actions: [
                                        TextButton(
                                          child: Text('No'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            webviewPlugin.show();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Yes'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });
                            },
                          )
                        ],
                      ),
                      withJavascript: true,
                      withLocalStorage: true,
                      withZoom: true,
                    )
              });
        });
  }
}