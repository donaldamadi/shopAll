class Entry {
  Entry(this.title, [this.url, this.asset, this.children = const <Entry>[], this.saved = false, this.id]);
  final String title;
  final List<Entry> children;
  final String url;
  final String asset;
  bool saved;
  final int id;

  // Map<String, dynamic> toMap(){
  //   return {
  //     'title': this.title, 
  //     'children': this.children,
  //     'url': this.url,
  //     'asset': this.asset,
  //     'saved': this.saved 
  //   };
  // }

  // factory Entry.fromMap(int id, Map<String, dynamic> map){
  //   return Entry(
  //     map['title'],
  //     map['url'],
  //     map['asset'],
  //     map['children'],
  //     map['saved'],
  //     id
  //   );
  // }

  // Entry copyWith({int id, String title, Entry children, String url, String asset, bool saved}){
  //   return Entry(
  //     title ?? this.title,
  //     url ?? this.url,
  //     asset ?? this.asset,
  //     children ?? this.children,
  //     saved ?? this.saved,
  //     id ?? this.id
  //   );
  // }
}