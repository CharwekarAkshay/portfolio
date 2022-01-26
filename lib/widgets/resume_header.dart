import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flowder/flowder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:portfolio/screens/screens.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_io/io.dart';

import '../constants.dart';

class ResumeHeader extends StatefulWidget {
  const ResumeHeader({Key? key}) : super(key: key);

  @override
  _ResumeHeaderState createState() => _ResumeHeaderState();
}

class _ResumeHeaderState extends State<ResumeHeader> {
  late DownloaderUtils options;
  late DownloaderCore core;
  late String path;

  final Permission _permission = Permission.storage;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _listenForPermissionStatus();
  }

  Future<void> _requestPermission(Permission permission) async {
    final status = await permission.request();

    setState(() {
      _permissionStatus = status;
    });
  }

  Future<void> initPlatformState() async {
    _setPath();
    if (!mounted) return;
  }

  void _setPath() async {
    // Only works on Andriod. Not supporting  IOS
    path = Directory('/storage/emulated/0/Download').path;
  }

  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(
      () => _permissionStatus = status,
    );
  }

  _handleBack(context) {
    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const LandingScreen(),
      ),
      ModalRoute.withName('/'),
    );
  }

  _handleFileDownloadDone() {
    Fluttertoast.showToast(
      msg: '$userFirstName\'s resume has been downloaded successfully',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: themeColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }

  _handleDownload() async {
    if (kIsWeb) {
      FirebaseStorage.instance.ref(resumeFileName).getData().then((data) {
        var url = html.Url.createObjectUrlFromBlob(html.Blob([data]));
        html.AnchorElement(href: url)
          ..setAttribute('download', resumeDownloadedName)
          ..click();
        _handleFileDownloadDone();
      });
    } else {
      _requestPermission(Permission.storage);
      _setPath();
      var pdfUrl =
          await FirebaseStorage.instance.ref(resumeFileName).getDownloadURL();

      // options = DownloaderUtils(
      //   progressCallback: (current, total) {
      //     final progress = (current / total) * 100;
      //   },
      //   file: File('$path/$resumeDownloadedName'),
      //   progress: ProgressImplementation(),
      //   onDone: _handleFileDownloadDone,
      // );
      // await Flowder.download(pdfUrl, options);
    }
  }

  _getDownloadingStateIcon() {
    return const Icon(Icons.file_download_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_outlined),
                color: themeColor,
                onPressed: () => _handleBack(context),
              ),
              const SizedBox(width: defaultSizing / 2),
              AutoSizeText(
                'Resume',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          IconButton(
            icon: _getDownloadingStateIcon(),
            color: themeColor,
            disabledColor: textColor,
            onPressed: _handleDownload,
          )
        ],
      ),
    );
  }
}
