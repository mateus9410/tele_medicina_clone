import 'package:flutter/material.dart';
import 'package:sigamed_tele_medicina/utilities/constants.dart';
import 'package:sigamed_tele_medicina/utilities/responsive.dart';

class HomeScreenMenuIcon extends StatelessWidget {
  HomeScreenMenuIcon({
    @required this.icon,
    @required this.color,
    @required this.title,
    this.onPressed,
  });

  final IconData icon;
  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    //Responsive Function => WidthPercentage(1.0%)
    final Function wp = Responsive(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height)
        .wp;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: wp(23.0),
        width: wp(23.0),
        decoration: BoxDecoration(
          gradient: kSigaMedToSigaMedLightGradient,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: kBlack26,
              blurRadius: 5.0,
              offset: Offset(3.0, 5.0),
            ),
            BoxShadow(
              color: kWhite,
              blurRadius: 5.0,
              offset: Offset(-3.0, -5.0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ShaderMask(
              shaderCallback: (bounds) => kGrey300ToWhiteGradient.createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: color),
              ),
            ),
            SizedBox(height: wp(1.0)),
            ShaderMask(
              shaderCallback: (bounds) => kGrey300ToWhiteGradient.createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
              child: Icon(
                icon,
                color: color,
                size: wp(6.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
