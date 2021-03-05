//import 'package:flutter/material.dart';
//import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
//
//class ReadScreen2 extends StatefulWidget {
//  @override
//  _ReadScreen2State createState() => _ReadScreen2State();
//}
//
//class _ReadScreen2State extends State<ReadScreen2> {
//  PDFDocument _doc;
//  bool _loading;
//
//  @override
//
//  void initState(){
//    super.initState();
//    _initPdf();
//  }
//
//  _initPdf() async{
//    setState(() {
//      _loading = true;
//    });
//    final doc = await PDFDocument.fromAsset("assets/PJBook4.pdf");
//    setState(() {
//      _doc = doc;
//      _loading = false;
//    });
//  }
//
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: _loading? Center(child: CircularProgressIndicator(),) :
//      PDFViewer(document: _doc,)
//    );
//  }
//}
