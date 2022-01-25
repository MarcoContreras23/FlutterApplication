import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrPage extends StatelessWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lector Qr'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.document_scanner_rounded),
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#F13333', 'Cancelar', false, ScanMode.QR);

          if (barcodeScanRes != '-1') {
            print(barcodeScanRes);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
