import 'package:flutter/material.dart';
import 'package:sigamed_tele_medicina/utilities/constants.dart';

void validatingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    child: Scaffold(
      backgroundColor: kBlack26,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 10.0),
            Text('Validando Dados', style: TextStyle(color: kWhite)),
          ],
        ),
      ),
    ),
  );
}
