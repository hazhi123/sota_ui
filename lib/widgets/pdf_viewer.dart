import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerSui extends StatelessWidget {
  final String url;
  const PdfViewerSui(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.network(url);
  }
}
