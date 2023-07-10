
import 'dart:typed_data';
import 'package:eshop_multivendor/Helper/Color.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';


class QRViewExample extends StatefulWidget {
  final String? title;
  final sellerId;
  final catId;
  final sellerData;
  QRViewExample({
    this.title,this.sellerId,this.sellerData,this.catId
  });

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}
StateSetter? checkoutState;

class _QRViewExampleState extends State<QRViewExample> {
  var url;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  MobileScannerController cameraController = MobileScannerController();


  // NewSellerModel? checkResult;
  //
  // checkCode(code)async{
  //
  //   print("working here");
  //   var headers = {
  //     'Cookie': 'ci_session=037e475492e22b22dc37efe636bf60a361575fa8'
  //   };
  //   var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}check_qrcode'));
  //   request.fields.addAll({
  //     'qrcode': '${code}',
  //     'user_id':'${CUR_USERID}'
  //   });
  //   print("parameter here ${request.fields}");
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await request.send();
  //   print("status code here ${response.statusCode}");
  //   if (response.statusCode == 200) {
  //     var finalResult = await response.stream.bytesToString();
  //     final jsonResponse = NewSellerModel.fromJson(json.decode(finalResult));
  //     print("status here now  and ${jsonResponse.error}");
  //     if(jsonResponse.error == false) {
  //       //setState(() {
  //       checkResult = jsonResponse;
  //       // });
  //
  //       print("ooooooooooo  ${checkResult!.date![0].userId}");
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SubCategory(title: widget.title.toString(),sellerId: checkResult!.date![0].userId.toString(),sellerData: checkResult!.date![0],)));
  //     }
  //   }
  //   else {
  //     var snackBar = SnackBar(
  //       content: Text('Qr code is Incorrect'),
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     Navigator.pop(context);
  //   }
  //
  // }


  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7)
          ),
          child: MobileScanner(
            //
            // fit: BoxFit.contain,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              final Uint8List? image = capture.image;
              for (final barcode in barcodes) {
                print("barcode value ${barcode.rawValue}");
                debugPrint('Barcode found! ${barcode.rawValue}');
                setState(() {
                  url = barcode.rawValue;
                  launchURL(url);
                  print('this is resultttttttttttttttttt${url}');
                });
               // checkCode(barcode.rawValue.toString());
                cameraController.dispose();
              }
            },
          ),
        ),
      ),
    );
  }
}


