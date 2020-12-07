class Entry {
  const Entry(this.title, [this.url, this.asset, this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
  final String url;
  final String asset;
}