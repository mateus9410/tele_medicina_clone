import 'package:flutter/material.dart';
import 'package:sigamed_tele_medicina/utilities/constants.dart';
import 'package:sigamed_tele_medicina/utilities/responsive.dart';

class LoginScreenButton extends StatelessWidget {
  LoginScreenButton({
    @required this.title,
    @required this.color,
    @required this.icon,
    @required this.onPressed,
    this.bottomSpacing = 2.0,
  });

  final String title;
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;
  final double bottomSpacing;

  @override
  Widget build(BuildContext context) {
    //Responsive Function => WidthPercentage(1.0%)
    final Function wp = Responsive(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height)
        .wp;

    return Container(
      height: wp(13.2),
      margin: EdgeInsets.only(
          left: wp(5.0), right: wp(5.0), bottom: wp(bottomSpacing)),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(wp(6.0)))),
      child: Material(
        color: kTransparent,
        child: InkWell(
          highlightColor: kHighlightWhite,
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: wp(8.0)),
                child: Text(
                  title.toUpperCase(),
                  style: TextStyle(color: kWhite),
                ),
              ),
              Container(
                width: wp(12.0),
                margin: EdgeInsets.only(
                    right: wp(2.0),
                    top: wp(2.0),
                    bottom: wp(2.0),
                    left: wp(1.0)),
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.all(Radius.circular(wp(6.0)))),
                child: Center(
                  child: Icon(
                    icon,
                    color: color,
                    size: wp(5.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
