import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:universal_html/html.dart';

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

  _handleDownload() {
    if (kIsWeb) {
      FirebaseStorage.instance.ref(resumeFileName).getData().then(
        (data) {
          var url = Url.createObjectUrlFromBlob(Blob([data]));
          AnchorElement(href: url)
            ..setAttribute('download', resumeDownloadedName)
            ..click();
        }
      );
    } else {}
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
