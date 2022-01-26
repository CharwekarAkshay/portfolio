import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../constants.dart';

class ResumeScreen extends StatefulWidget {
  static String routeName = '/resume';
  const ResumeScreen({Key? key}) : super(key: key);

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

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

  @override
  Widget build(BuildContext context) {
    Reference ref = FirebaseStorage.instance.ref(resumeFileName);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ResumeHeader(),
            Expanded(
              child: FutureBuilder(
                future: ref.getDownloadURL(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
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
