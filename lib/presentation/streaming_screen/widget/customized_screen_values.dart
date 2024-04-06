class CustomizedScreenValues {
  String streamTitle = 'Stream_Title';
  String streamDescription = 'Stream_Description';
  String streamAudience = '';
  String videoQuality = '';

  double rectChatTop = 0;
  double rectChatBottom = 0;
  double rectChatLeft = 0;
  double rectChatRight = 0;

  double rectImageTop = 0;
  double rectImageBottom = 0;
  double rectImageLeft = 0;
  double rectImageRight = 0;

  double mediaPreviewHeight = 0;
  double mediaPreviewWidth = 0;

  bool showChatPreview = false;
  bool showImagePreview = false;

  String selectedPicturePath = '';

  CustomizedScreenValues({
    required this.mediaPreviewWidth,
    required this.mediaPreviewHeight,
    required this.rectChatTop,
    required this.rectChatRight,
    required this.rectChatLeft,
    required this.rectChatBottom,
    required this.rectImageTop,
    required this.rectImageRight,
    required this.rectImageLeft,
    required this.rectImageBottom,
    required this.showChatPreview,
    required this.showImagePreview,
    required this.selectedPicturePath,
  });
}