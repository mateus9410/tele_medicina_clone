import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';
import 'package:sigamed_tele_medicina/screens/center_screen/center_screen.dart';
import 'package:sigamed_tele_medicina/screens/home_screen/home_screen.dart';
import 'package:sigamed_tele_medicina/screens/login_screen/login_screen.dart';
import 'package:sigamed_tele_medicina/screens/top_screen/top_screen.dart';
import 'package:sigamed_tele_medicina/screens/top_screen/top_screen_file_registration.dart';

class Routes {
  static final sailor = Sailor(
    options: SailorOptions(
      defaultTransitions: [
        SailorTransition.fade_in,
      ],
      defaultTransitionCurve: Curves.easeInOut,
      defaultTransitionDuration: Duration(milliseconds: 500),
    ),
  );

  static void createRoutes() {
    sailor.addRoutes(
      <SailorRoute>[
        // ************ //
        // Main Screens //
        // ************ //
        SailorRoute(
          name: LoginScreen.id,
          builder: (context, args, params) => LoginScreen(),
        ),
        SailorRoute(
          name: HomeScreen.id,
          builder: (context, args, params) => HomeScreen(),
        ),

        // ******************** //
        //   Top Route Screens  //
        // ******************** //
        SailorRoute(
          name: TopScreen.id,
          builder: (context, args, params) => TopScreen(),
        ),
        SailorRoute(
            name: TopScreenFileRegistration.id,
            builder: (context, args, params) =>
                TopScreenFileRegistration(params.param<Upload>('upload')),
            params: [
              SailorParam<Upload>(name: 'upload', isRequired: true),
            ]),
        // ********************** //
        //  Center Route Screens  //
        // ********************** //
        SailorRoute(
          name: CenterScreen.id,
          builder: (context, args, params) => CenterScreen(),
        ),
      ],
    );
  }
}
