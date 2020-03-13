import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class GlobalKeys {
  static final GlobalKey<FormBuilderState> loginScreenFormKey =
      GlobalKey<FormBuilderState>(debugLabel: 'LoginScreen');

  static final GlobalKey<FormBuilderState> fileRegistrationFormKey =
      GlobalKey<FormBuilderState>(debugLabel: 'TopScreenFileRegistration');
}
