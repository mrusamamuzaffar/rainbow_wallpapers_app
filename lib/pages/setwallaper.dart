
import 'dart:typed_data';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:rainbow/constants/constraints.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:dio/dio.dart';

class Wallpaper extends StatefulWidget {
  final String url, poUrl, photographer, photographerUrl, avg_color;
  final int width, height;
  Wallpaper(
      {required this.url,
      required this.photographer,
      required this.photographerUrl,
      required this.avg_color,
      required this.width,
      required this.height,
      required this.poUrl,
      Key? key})
      : super(key: key);

  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  Widget build(BuildContext context) {
    bool downloading = false;

    Future<bool> setWallpaper() async {
      try {
        int location =
            WallpaperManagerFlutter.HOME_SCREEN; //can be Home/Lock Screen
        var file =
            await DefaultCacheManager().getSingleFile(widget.url.toString());
        print(file.path.toString());

        WallpaperManagerFlutter().setwallpaperfromFile(file, location);

        downloading = false;
        AwesomeDialog(
          context: context,
          //customHeader: Image.asset("assets/icon/icon.png"),
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Wallpaper Updated',
          dialogBackgroundColor: Colors.white,

          btnOkOnPress: () {},
          btnOkColor: backgroundColor,
        ).show();
      } catch (e) {
        AwesomeDialog(
          context: context,
          //customHeader: Image.asset("assets/icon/icon.png"),
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error Setting Wallpaper',
          dialogBackgroundColor: Colors.white,

          btnOkOnPress: () {},
          btnOkColor: backgroundColor,
        ).show();
      }

      return downloading;
    }

    Future<bool> bothScreen() async {
      try {
        int location =
            WallpaperManagerFlutter.BOTH_SCREENS; //can be Home/Lock Screen
        var file =
            await DefaultCacheManager().getSingleFile(widget.url.toString());
        print(file.path.toString());

        WallpaperManagerFlutter().setwallpaperfromFile(file, location);

        downloading = true;
        AwesomeDialog(
          context: context,
          //customHeader: Image.asset("assets/icon/icon.png"),
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Wallpaper Updated',
          dialogBackgroundColor: Colors.white,

          btnOkOnPress: () {},
          btnOkColor: backgroundColor,
        ).show();
      } catch (e) {
        AwesomeDialog(
          context: context,
          //customHeader: Image.asset("assets/icon/icon.png"),
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error Setting Wallpaper',
          dialogBackgroundColor: Colors.white,

          btnOkOnPress: () {},
          btnOkColor: backgroundColor,
        ).show();
      }

      return downloading;
    }

    Future<bool> lockscreen() async {
      try {
        int location =
            WallpaperManagerFlutter.LOCK_SCREEN; //can be Home/Lock Screen
        var file =
            await DefaultCacheManager().getSingleFile(widget.url.toString());
        print(file.path.toString());

        WallpaperManagerFlutter().setwallpaperfromFile(file, location);

        downloading = false;
        AwesomeDialog(
          context: context,
          //customHeader: Image.asset("assets/icon/icon.png"),
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Wallpaper Updated',
          dialogBackgroundColor: Colors.white,

          btnOkOnPress: () {},
          btnOkColor: backgroundColor,
        ).show();
      } catch (e) {
        AwesomeDialog(
          context: context,
          //customHeader: Image.asset("assets/icon/icon.png"),
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error Setting Wallpaper',
          dialogBackgroundColor: Colors.white,

          btnOkOnPress: () {},
          btnOkColor: backgroundColor,
        ).show();
      }

      return downloading;
    }

    Widget _floatingCollapsed() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
        ),
        margin: const EdgeInsets.fromLTRB(5.0, 38.0, 5.0, 0.0),
        child: Center(
            child: InkWell(
          onTap: () {
            //todo
          },
          child: Icon(
            Icons.arrow_upward_sharp,
            size: 30,
            color: Colors.white,
          ),
        )),
      );
    }

    Widget _floatingPanel() {
      return Container(
        margin: EdgeInsets.fromLTRB(5.0, 38.0, 5.0, 20.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          shape: BoxShape.rectangle,
          color: Colors.black.withOpacity(0.8),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              offset: Offset(5.0, 5.0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    print("Save button Clicked");
                    var status = await Permission.storage.request();
                    if (await Permission.storage.isPermanentlyDenied) {
                      // The user opted to never again see the permission request dialog for this
                      // app. The only way to change the permission's status now is to let the
                      // user manually enable it in the system settings.
                      openAppSettings();
                    }

                    if (status.isGranted) {
                      try {
                         AwesomeDialog(
                          context: context,
                          //customHeader: Image.asset("assets/icon/icon.png"),
                          dialogType: DialogType.NO_HEADER,
                          animType: AnimType.BOTTOMSLIDE,
                          autoHide: Duration(seconds: 5),
                          title: 'Wallpaper is Downloading',
                          customHeader: Icon(Icons.cached),
                          dismissOnBackKeyPress: false,

                        

                        ).show();
                        var response = await Dio().get(widget.url.toString(),
                            options: Options(responseType: ResponseType.bytes));
                        final image_ = await ImageGallerySaver.saveImage(
                            Uint8List.fromList(response.data),
                            quality: 100,
                            name: "hello");
                             await Future.delayed(const Duration(seconds: 5));

                      

                        

                        AwesomeDialog(
                          context: context,
                          //customHeader: Image.asset("assets/icon/icon.png"),
                          dialogType: DialogType.SUCCES,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Wallpaper is downloaded',

                          desc: 'Wallpaper is saved in ' + image_.toString(),

                          btnOkOnPress: () {},
                        ).show();
                      } catch (e) {
                        AwesomeDialog(
                          context: context,
                          //customHeader: Image.asset("assets/icon/icon.png"),
                          dialogType: DialogType.WARNING,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Wallpaper is failed to download.',

                          desc: 'There are some errors' + e.toString(),

                          btnOkOnPress: () {},
                        ).show();
                      }
                    }
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.save_alt,
                        color: Colors.black,
                        size: 35,
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    print("Favorite clicked");
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.black,
                        size: 35,
                      ),),
                ),
                PopupMenuButton(
                    color: Colors.black,
                    icon: Icon(
                      Icons.wallpaper,
                      color: Colors.white,
                      size: 35,
                    ),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text(
                              "BOTH SCREEN",
                              style: TextStyle(color: Colors.white),
                            ),
                            value: 1,
                            onTap: () {
                              bothScreen();
                            },
                          ),
                          PopupMenuItem(
                            child: Text("HOME SCREEN",
                                style: TextStyle(color: Colors.white)),
                            value: 2,
                            onTap: () {
                              setWallpaper();
                            },
                          ),
                          PopupMenuItem(
                            child: Text("LOCK SCREEN",
                                style: TextStyle(color: Colors.white)),
                            value: 2,
                            onTap: () {
                              lockscreen();
                            },
                          )
                        ]),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.share,
                        color: Colors.black,
                        size: 35,
                      )),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 45),
            ),
            Text(
              "Creator",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(widget.photographer),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    child: Text(widget.photographer[0].toUpperCase()),
                  ),
                  backgroundColor: Colors.white,
                ),
                Chip(
                  label: Text("URL"),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    child: Icon(Icons.language),
                  ),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            Text(
              "Colors",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: "assets/fonts/bold.otf"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(
                  label: Text(" "),
                  backgroundColor: HexColor(widget.avg_color),
                ),
                Chip(
                  label: Text(" "),
                  backgroundColor: Colors.black,
                ),
              ],
            ),
            Text(
              "Size",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: "assets/fonts/bold.otf"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(
                    label: Text(widget.height.toString() +
                        "X" +
                        widget.width.toString()),
                    backgroundColor: Colors.white),
              ],
            ),
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        print("pop");
        return false;
      },
      child: Scaffold(
        body: SlidingUpPanel(
          renderPanelSheet: false,
          panel: _floatingPanel(),
          collapsed: _floatingCollapsed(),
          body: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: widget.url,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Positioned(
                top: 60,
                right: 15,
                left: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_left,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
