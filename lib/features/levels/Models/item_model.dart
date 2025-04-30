
class ItemModel {
  final String pnoun;
  final String value;
  final String letter;
  bool accepting;
  ItemModel({
    required this.pnoun,
    required this.value,
    required this.letter,
    this.accepting = false,
  });
}
