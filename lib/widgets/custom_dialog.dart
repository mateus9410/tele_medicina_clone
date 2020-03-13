import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sigamed_tele_medicina/utilities/constants.dart';
import 'package:sigamed_tele_medicina/utilities/responsive.dart';
import 'package:sigamed_tele_medicina/utilities/routes.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    @required this.title,
    @required this.onOkButtonPressed,
    @required this.width,
    @required this.height,
    this.description,
    this.okButtonText = 'Continuar',
    this.onlyOkButton = false,
  })  : assert(title != null),
        assert(width != null),
        assert(height != null);

  final Text title;
  final double width;
  final double height;
  final Widget description;
  final bool onlyOkButton;
  final String okButtonText;
  final VoidCallback onOkButtonPressed;

  @override
  Widget build(BuildContext context) {
    //Responsive Function => WidthPercentage(1.0%)
    final Function wp = Responsive(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height)
        .wp;

    final double fontSize = wp(2.3);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: height + wp(2.0),
          width: width + wp(2.0),
          decoration: BoxDecoration(
              gradient: kSigaMedToSigaMedLightGradient,
              borderRadius: BorderRadius.all(Radius.circular(wp(1.0)))),
          child: Center(
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.all(Radius.circular(wp(1.0)))),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(wp(4.0)),
                      child: title,
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: wp(4.0)),
                              child: description,
                            ),
                          ),
                          //
                          //Cancel and Ok Buttons
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: wp(4.0),
                              vertical: wp(2.0),
                            ),
                            child: Row(
                              mainAxisAlignment: !onlyOkButton
                                  ? MainAxisAlignment.spaceBetween
                                  : MainAxisAlignment.center,
                              children: <Widget>[
                                !onlyOkButton
                                    ? Container(
                                        width: wp(20.0),
                                        height: wp(7.0),
                                        child: RaisedButton(
                                          color: kWhite,
                                          onPressed: Routes.sailor.pop,
                                          child: Text(
                                            'Cancelar',
                                            style: TextStyle(
                                              color: kGrey600,
                                              fontSize: fontSize,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                Container(
                                  width: wp(20.0),
                                  height: wp(7.0),
                                  child: RaisedButton(
                                    color: kSigaMed,
                                    onPressed: onOkButtonPressed ?? () {},
                                    child: Text(
                                      okButtonText,
                                      style: TextStyle(
                                        color: kWhite,
                                        fontSize: fontSize,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
