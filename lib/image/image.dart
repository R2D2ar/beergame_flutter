import 'package:flutter/cupertino.dart';

class AboutImage extends StatefulWidget {
  const AboutImage({Key? key}) : super(key: key);

  @override
  _AboutImageState createState() => _AboutImageState();
}

class _AboutImageState extends State<AboutImage> {
  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(image: "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg", placeholder: "assets/Untitled-1.jpg");
  }
}