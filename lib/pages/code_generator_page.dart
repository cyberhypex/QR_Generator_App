

import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_generator_app/pages/homePage.dart';

class QrGeneratorPage extends StatefulWidget {
  const QrGeneratorPage({super.key});

  @override
  State<QrGeneratorPage> createState() => _QrGeneratorPageState();
}

class _QrGeneratorPageState extends State<QrGeneratorPage> {

  final GlobalKey globalKey=GlobalKey();
  String qrData="";
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

    TextSpan(text: 'Code Generator',style: TextStyle(
    fontSize: 30,
    color: Colors.blueGrey.shade400,
    fontWeight: FontWeight.normal
    )),
    ],
    ),
    ),

    ),
    body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                  const SizedBox(height: 30,),
                  RepaintBoundary(
                      key: globalKey,
                    child: Container(
                      height: 300,
                      width: 300,
                      color: Colors.white,
                      child: Center(
                        child: qrData.isEmpty? Text('Enter your data to see your QR here',
                        style: TextStyle(color: Colors.blueAccent,fontSize: 16,fontWeight: FontWeight.bold),
                        ) : QrImageView(data: qrData,
                        version: QrVersions.auto,



                          size: 300,
                        )
                      ),
                    ),
                  ),
const SizedBox(
  height: 50,
),
SizedBox(
  width: MediaQuery.of(context).size.width*0.8,
  child: TextField(
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(


      hintText: "Enter your data",
      hintStyle: TextStyle(color: Colors.white,fontSize: 16),

      border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.blueAccent.shade700,

        ),
      ),
    ),
    onChanged: (value){
      setState(() {
        qrData=value;
      });
    },
  ),
)


,


          ],
        ),
      ),
    ),

    ));
  }
}
