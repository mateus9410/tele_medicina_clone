import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sigamed_tele_medicina/screens/home_screen/home_screen.dart';
import 'package:sigamed_tele_medicina/screens/login_screen/login_reset.dart';
import 'package:sigamed_tele_medicina/screens/login_screen/login_screen_button.dart';
import 'package:sigamed_tele_medicina/screens/login_screen/login_screen_field.dart';
import 'package:sigamed_tele_medicina/signup/signup_screen.dart';
import 'package:sigamed_tele_medicina/utilities/clip_paths.dart';
import 'package:sigamed_tele_medicina/utilities/constants.dart';
import 'package:sigamed_tele_medicina/utilities/global_keys.dart';
import 'package:sigamed_tele_medicina/utilities/responsive.dart';
import 'package:sigamed_tele_medicina/utilities/routes.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    //Responsive Function => WidthPercentage(1.0%)
    final Function wp = Responsive(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height)
        .wp;

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: FormBuilder(
            key: GlobalKeys.loginScreenFormKey,
            initialValue: {
              'usuário': 'Usuario123',
              'senha': 'senha123@',
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _buildHeader(context),
                LoginScreenField(
                  title: 'Usuário',
                  icon: Icons.person_outline,
                ),
                LoginScreenField(
                  title: 'Senha',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => ResetPasswordPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Recuperar senha',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: wp(8.0)),
                LoginScreenButton(
                  title: 'Login',
                  color: kSigaMed,
                  icon: FontAwesomeIcons.arrowRight,
                  onPressed: () => Routes.sailor(HomeScreen.id),
                  bottomSpacing: wp(2.0),
                ),
                LoginScreenButton(
                  title: 'Entrar com o Facebook',
                  color: kFacebook,
                  icon: FontAwesomeIcons.facebookF,
                  onPressed: () => print('Continue with Facebook clicked'),
                ),
                LoginScreenButton(
                  title: 'Entrar com o Google',
                  color: kGoogle,
                  icon: FontAwesomeIcons.google,
                  onPressed: () => print('Continue with Google clicked'),
                ),
                //
                //Registration Button
                //
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Não tem uma conta? ',
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                        },
                        child: Text(
                          'Cadastre-se',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    //Responsive Function => WidthPercentage(1.0%)
    final Function wp = Responsive(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height)
        .wp;

    return ClipPath(
      clipper: LoginClipper(),
      child: Hero(
        tag: 'clip',
        child: Container(
          height: wp(50.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(wp(17.0)),
          child: Image.asset(
            'images/sigamed_tele_logo.png',
          ),
        ),
      ),
    );
  }
}
