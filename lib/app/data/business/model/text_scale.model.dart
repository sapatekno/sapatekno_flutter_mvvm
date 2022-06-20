class TextScaleModel {
  int id;
  String textScaleName;
  double scaleFactor;

  TextScaleModel({
    required this.id,
    required this.textScaleName,
    required this.scaleFactor,
  });

  double toScaleFactor() => scaleFactor;
}
