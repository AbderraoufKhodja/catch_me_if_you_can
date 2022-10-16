import 'package:catch_me_if_you_can/pass_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class OpenedMenuPage extends StatefulWidget {
  const OpenedMenuPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OpenedMenuPage> createState() => _OpenedMenuPageState();
}

class _OpenedMenuPageState extends State<OpenedMenuPage> {
  Size get _size => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade200,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.transparent,
            ),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onLongPress: () {
          FlutterBarcodeScanner.scanBarcode(
            "#ff4caf50",
            " ",
            false,
            ScanMode.QR,
          ).then((value) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const PassPage();
            }));
          });
        },
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(
          'assets/WeChat Image_20221014160536.jpg',
          height: _size.height,
          width: _size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
