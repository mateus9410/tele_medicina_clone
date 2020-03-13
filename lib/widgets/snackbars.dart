import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:sigamed_tele_medicina/utilities/constants.dart';

class Snackbars {
  static Flushbar flushbarFormError(BuildContext context) => Flushbar(
        backgroundColor: kSigaMed,
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: kRed700,
        ),
        duration: Duration(seconds: 4),
        leftBarIndicatorColor: kRed700,
        message:
            'Por favor, verifique os campos marcados em vermelho antes de prosseguir o cadastro.',
      );

  static Flushbar flushbarLoginError(BuildContext context) => Flushbar(
        backgroundColor: kSigaMed,
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: kRed700,
        ),
        duration: Duration(seconds: 4),
        leftBarIndicatorColor: kRed700,
        message: 'Erro',
      );
}
