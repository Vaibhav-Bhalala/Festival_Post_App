class Quotes {
  String quote;
  String festival;

  Quotes({required this.festival, required this.quote});

  factory Quotes.fromMap({required Map Data}) {
    return Quotes(festival: Data['festival'], quote: Data['quote']);
  }
}