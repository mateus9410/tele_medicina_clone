import 'package:flutter/material.dart';

/* ************************************** *
                 Colors
 * ************************************** */

const Color kTransparent = Color(0x00000000);
const Color kBlack = Color(0xFF000000);
const Color kBlack87 = Color(0xDD000000);
const Color kBlack54 = Color(0x8A000000);
const Color kBlack26 = Color(0x42000000);
const Color kGrey300 = Color(0xFFE0E0E0);
const Color kGrey600 = Color(0xFF757575);
const Color kWhite70 = Color(0xB3FFFFFF);
const Color kHighlightWhite = Color(0x66FFFFFF);
const Color kWhite = Color(0xFFFFFFFF);
const Color kRed200 = Color(0xFFef9a9a);
const Color kRed500 = Color(0xFFF44336);
const Color kRed700 = Color(0xFFD32F2F);
const Color kSigaMed = Color(0xFF18B0BA);
const Color kSigaMedLight = Color(0xFF39DBE5);
const Color kHighlightSigaMed = Color(0x2018B0BA);
const Color kFacebook = Color(0xFF4267B2);
const Color kGoogle = Color(0xFFD62D20);

/* ************************************** *
                 Gradients
 * ************************************** */
//SigaMed -> White
const LinearGradient kSigaMedToSigaMedLightGradient = LinearGradient(colors: [
  Color(0xFF18B0BA),
  Color(0xFF39DBE5),
]);

//Grey[600] -> Grey[500]
const LinearGradient kGrey600To500Gradient = LinearGradient(colors: [
  Color(0xFF757575),
  Color(0xFF9E9E9E),
]);

//Grey[300] -> White
const LinearGradient kGrey300ToWhiteGradient = LinearGradient(colors: [
  Color(0xFFE0E0E0),
  Color(0xFFFFFFFF),
]);

//Grey[200] -> White
const LinearGradient kGrey200ToWhiteGradient = LinearGradient(colors: [
  Color(0xFFEEEEEE),
  Color(0xFFFFFFFF),
]);

//White -> Grey[200]
const LinearGradient kWhiteToGrey100Gradient = LinearGradient(colors: [
  Color(0xFFFFFFFF),
  Color(0xFFF5F5F5),
]);
