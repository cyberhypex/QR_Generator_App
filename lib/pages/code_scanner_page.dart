

import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qr_generator_app/pages/homePage.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScannerPage> {
  String qrResult='Scanned data will appear here';
  Future<void> scanQR() async{
      try{
          final qrCode =await  FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
          if(!mounted) return;

          setState(() {
            this.qrResult=qrCode.toString();
          });
      }on PlatformException{
        qrResult='Failed to read QR Code';
      }

  }


  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop: () async => false,
    child:
   Scaffold(
      backgroundColor: Colors.white12,

      appBar: AppBar(
        leading: IconButton(onPressed: ()=>
            Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        )),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage()));
            });
          }, icon: Icon(
            Icons.home_rounded,
            color: Colors.white,
          ))
        ],
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:'QR',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 45,color: Colors.blueAccent.shade100)
              ),

              TextSpan(text: 'Code Scanner',style: TextStyle(
                fontSize: 30,
                color: Colors.blueGrey.shade400,
                fontWeight: FontWeight.normal
              )),
            ],
          ),
        ),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text('$qrResult',style: TextStyle(color: Colors.white),),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: scanQR, child: Text('Scan QR')),

          ],
        ),
      )
   ));
  }
}
