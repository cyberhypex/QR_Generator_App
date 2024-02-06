

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_generator_app/pages/code_generator_page.dart';
import 'package:qr_generator_app/pages/code_scanner_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text:'QR ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.blueAccent.shade100)
              ),

              TextSpan(text: 'Code Scanner & Generator',style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey.shade400,
                  fontWeight: FontWeight.normal
              )),
            ],
          ),
        ),

      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.blueAccent.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("What you want ??",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),

                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScannerPage()));

                      });
                    }, child: Text('Scan QR??',style: TextStyle(decorationColor: Colors.white,fontSize: 20),)),
                    const SizedBox(height: 5,),
                    ElevatedButton(onPressed: (

                        ){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QrGeneratorPage()));
                      });
                    }, child: Text('Generate QR??',style: TextStyle(decorationColor: Colors.white,fontSize: 20),))
                  ],
          ),
        ),
      )
    );
  }
}
