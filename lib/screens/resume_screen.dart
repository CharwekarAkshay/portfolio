import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flowder/flowder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_io/io.dart';

import '../constants.dart';
import 'screens.dart';

class ResumeScreen extends StatefulWidget {
  static String routeName = '/resume';
  const ResumeScreen({Key? key}) : super(key: key);

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  String _pdfFileUrl = '';

  late DownloaderUtils options;
  late DownloaderCore core;
  late  String path;

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
      print(status);
      _permissionStatus = status;
      print(_permissionStatus);
    });
  }

  Future<void> initPlatformState() async {
    _setPath();
    if (!mounted) return;
  }

  void _setPath() async {
    // Only works on Andriod. Not supporting  IOS
    path = Directory('/storage/emulated/0/Download').path;
    print(path);
  }

  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(() => _permissionStatus = status);
  }

  _buildPdfViewer(String pdfUrl) {
    return SfPdfViewerTheme(
      data: SfPdfViewerThemeData(
        backgroundColor: scaffoldColor,
        progressBarColor: themeColor,
      ),
      child: SfPdfViewer.network(
        pdfUrl,
        key: _pdfViewerKey,
      ),
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

  _handleFileDownloadDone() {}

  _handleDownload() async {
    if (kIsWeb) {
      FirebaseStorage.instance.ref(resumeFileName).getData().then((data) {
        var url = html.Url.createObjectUrlFromBlob(html.Blob([data]));
        html.AnchorElement(href: url)
          ..setAttribute('download', resumeDownloadedName)
          ..click();
      });
    } else {
      _requestPermission(Permission.storage);
      _setPath();
      options = DownloaderUtils(
        progressCallback: (current, total) {
          final progress = (current / total) * 100;
          print('Downloading: $progress');
        },
        file: File('$path/$resumeDownloadedName'),
        progress: ProgressImplementation(),
        deleteOnCancel: true,
        onDone: _handleFileDownloadDone,
      );
      await Flowder.download(_pdfFileUrl, options);
    }
  }

  @override
  Widget build(BuildContext context) {
    Reference ref = FirebaseStorage.instance.ref(resumeFileName);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
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
                    icon: const Icon(Icons.file_download_outlined),
                    color: themeColor,
                    disabledColor: textColor,
                    onPressed: _handleDownload,
                  )
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: ref.getDownloadURL(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    _pdfFileUrl = snapshot.data!;
                    return _buildPdfViewer(snapshot.data!);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
