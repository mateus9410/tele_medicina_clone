import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sigamed_tele_medicina/utilities/constants.dart';
import 'package:sigamed_tele_medicina/utilities/responsive.dart';

class LoginScreenField extends StatelessWidget {
  LoginScreenField({
    @required this.title,
    @required this.icon,
    this.obscureText = false,
  });

  final String title;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    //Responsive Function => WidthPercentage(1.0%)
    final Function wp = Responsive(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height)
        .wp;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: wp(13.0),
            right: wp(13.0),
            top: wp(3.0),
            bottom: wp(1.0),
          ),
          child: Text(
            title,
            style: TextStyle(color: kBlack26),
          ),
        ),
        Container(
          height: wp(13.2),
          margin: EdgeInsets.symmetric(horizontal: wp(5.0)),
          decoration: BoxDecoration(
              border: Border.all(color: kBlack26),
              borderRadius: BorderRadius.all(Radius.circular(wp(6.0)))),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: wp(5.0)),
                child: Icon(icon, color: kBlack26),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: wp(5.0)),
                height: wp(8.0),
                width: 1.0,
                color: kBlack26,
              ),
              Expanded(
                child: FormBuilderTextField(
                  attribute: title.replaceAll(' ', '').toLowerCase(),
                  obscureText: obscureText,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
