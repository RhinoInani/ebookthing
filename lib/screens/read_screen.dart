import 'dart:io';

import 'package:ebookthing/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';


class ReadScreen extends StatefulWidget {
  final currentPage;
  final thing;

  const ReadScreen({Key key, this.thing, this.currentPage}) : super(key: key);
  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  String assetPDFPath = "";

  @override
  void initState() {
    super.initState();

    getFileFromAsset(widget.thing).then((f) {
      setState(() {
        assetPDFPath = f.path;
        print(assetPDFPath);
      });
    });
  }

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdf.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Bitmap.png"),
              fit: BoxFit.fill,
            )
        ),
        child: Center(
          child: Builder(
            builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: RoundedButton(
                    text: "Download Book",
                    press: () {
                      if (assetPDFPath != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PdfViewPage(path: assetPDFPath,)));
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}

class PdfViewPage extends StatefulWidget {
  final String path;
  final int page;

  const PdfViewPage({Key key, this.path, this.page, }) : super(key: key);

  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  dynamic bookmarkIcon = Icon(Icons.bookmark_border);
  dynamic bookmarkedPage;
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  dynamic _updateIcon(){
    setState(() {
      bookmarkIcon = Icon(Icons.bookmark);
      bookmarkedPage = _currentPage;
    });
  }

  @override
  Widget build(BuildContext context) {
//    _currentPage = widget.page;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            PDFView(
              filePath: widget.path,
              autoSpacing: true,
              enableSwipe: true,
              pageSnap: true,
              swipeHorizontal: true,
              nightMode: false,
              onError: (e) {
                print(e);
              },
              onRender: (_pages) {
                setState(() {
                  _totalPages = _pages;
                  pdfReady = true;
                });
              },
              onViewCreated: (PDFViewController vc) {
                _pdfViewController = vc;
              },
              onPageChanged: (int page, int total) {
                setState(() {});
              },
              onPageError: (page, e) {},
            ),
            !pdfReady
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Offstage()
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      color: Colors.black,
                      iconSize: 30,
                      icon: bookmarkIcon,
//                      onPressed: _updateIcon(),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _currentPage > 0
                    ? FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  label: Text("Go to ${_currentPage - 1}"),
                  onPressed: () {
                    _currentPage -= 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
                    : Offstage(),
                _currentPage + 1 < _totalPages
                    ? FloatingActionButton.extended(
                  backgroundColor: Colors.green,
                  label: Text("Go to ${_currentPage + 1}"),
                  onPressed: () {
                    _currentPage += 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
                    : Offstage(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}