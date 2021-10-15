import 'package:hive/hive.dart';
// // import 'package:path_provider/path_provider.dart';
part 'favorite_model.g.dart'; // Name of the TypeAdapter we will generate in the future

@HiveType(typeId: 0)
class Favorite extends HiveObject{
  @HiveField(0)
  String name;

  @HiveField(1)
  bool isFavorited;

  @HiveField(2)
  String url;

  @HiveField(3)
  String logo;

  Favorite({this.name, this.isFavorited, this.url, this.logo});
}