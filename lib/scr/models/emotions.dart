enum Emotions {
  like,
  haha,
  love,
  wow,
  angry,
}

extension EmotionsX on Emotions {
  String get assetImage {
    return 'images/${name.toLowerCase()}.gif';
  }
}
