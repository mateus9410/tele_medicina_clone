import 'package:flutter/material.dart';
import 'package:sigamed_tele_medicina/utilities/responsive.dart';

class  ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Function wp = Responsive(MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height)
        .wp;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'images/sigamed_tele_logo.png',
          height: wp(8.0),
        ),
        flexibleSpace: Image.asset(
          'images/background.jpg',
          fit: BoxFit.cover,
        ),
      ),
      body: Container(color: Colors.white,
      ),
    );
  }
}
