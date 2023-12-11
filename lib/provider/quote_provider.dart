import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class QuoteProvider extends ChangeNotifier {
  List<TextStyle> family = [
    GoogleFonts.cabin(fontSize: 20),
    GoogleFonts.damion(fontSize: 20),
    GoogleFonts.dekko(fontSize: 20),
    GoogleFonts.aBeeZee(fontSize: 20),
    GoogleFonts.lato(fontSize: 20),
    GoogleFonts.poppins(fontSize: 20),
    GoogleFonts.abrilFatface(fontSize: 20),
    GoogleFonts.alike(fontSize: 20),
  ];

  List<String> img = [
    "https://wallpapercave.com/wp/wp2801057.jpg",
    "https://getwallpapers.com/wallpaper/full/c/f/6/1085685-vertical-simple-backgrounds-1080x1920.jpg",
    "https://wallpaper-mania.com/wp-content/uploads/2018/09/High_resolution_wallpaper_background_ID_77701443960-1200x2133.jpg",
    "https://i.pinimg.com/originals/91/68/0c/91680c55372fd69e0ade4ee384ce1afb.jpg",
    "https://wallpaperaccess.com/full/2643592.jpg",
    "https://cdn.wallpapersafari.com/77/71/1pMSEa.jpg",
    "https://c4.wallpaperflare.com/wallpaper/213/306/518/texture-textured-portrait-display-vertical-wallpaper-preview.jpg"
  ];

  Color chooseColor = Colors.black;
  Color chooseBgColor = Colors.white;
  String chooseFontFamily=GoogleFonts.cabin().fontFamily!;
  String chooseImage = '';
  GlobalKey repaintBoundary = GlobalKey();

  void resetAll(){
    chooseColor = Colors.black;
    chooseBgColor = Colors.white;
    chooseFontFamily=GoogleFonts.cabin().fontFamily!;
    chooseImage = '';
    notifyListeners();
  }

  void changeColor(Color color) {
    chooseColor = color;
    notifyListeners();
  }

  void changeBgColor(Color color) {
    chooseBgColor = color;
    notifyListeners();
  }

  void changeBgImage(String img){
    chooseImage = img;
    notifyListeners();
  }

  void changeFontFamily(String fontFamily){
    chooseFontFamily = fontFamily;
    notifyListeners();
  }

  void shareImage()async{
    RenderRepaintBoundary boundary = repaintBoundary.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData =
    await image.toByteData(format: ui.ImageByteFormat.png);
    var pngBytes = byteData?.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/image.jpg').create();
    file.writeAsBytesSync(pngBytes!);
    ShareExtend.share(file.path, "file");
  }

}
