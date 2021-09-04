class Book {
  String _title;
  String _author;
  String _page;
  String _body;

  Book(this._title, this._author, this._page, this._body);

  String get body => _body;

  String get page => _page;

  String get author => _author;

  String get title => _title;
}