import 'dart:io';
import 'package:flutter/material.dart';
import 'pdf/pdf_api.dart';
import 'package:flutter/cupertino.dart';
import 'pdf/pdf_viewer_page.dart';
import 'pdf/button_widget.dart';
import 'package:web_browser/web_browser.dart';

class MainPage extends StatefulWidget {
  @override
  MyApp createState() => MyApp();
}

class MyApp extends State {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                ButtonWidget(
                  text: 'Network PDF',
                  onClicked: () async {
                    final url =
                        'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    //openPDF(context, file);
                    test();
                  },
                  key: UniqueKey(),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
}

void openPDF(BuildContext context, File file) => Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => PDFViewerPage(key: UniqueKey(), file: file)),
    );

void test() {
  runApp(MaterialApp(
    home: Scaffold(
      body: SafeArea(
        child: WebBrowser(
          initialUrl:
              'https://drive.google.com/file/d/0B0ierCbTyP1oWG9XU0wtU25vNms/view?usp=sharing',
          javascriptEnabled: true,
        ),
      ),
    ),
  ));
}
