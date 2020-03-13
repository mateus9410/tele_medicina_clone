import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:sigamed_tele_medicina/screens/top_screen/top_screen.dart';
import 'package:sigamed_tele_medicina/screens/top_screen/top_screen_file_registration_form.dart';
import 'package:sigamed_tele_medicina/utilities/constants.dart';
import 'package:sigamed_tele_medicina/utilities/global_keys.dart';
import 'package:sigamed_tele_medicina/utilities/responsive.dart';
import 'package:sigamed_tele_medicina/utilities/routes.dart';
import 'package:sigamed_tele_medicina/widgets/snackbars.dart';
import 'package:sigamed_tele_medicina/widgets/validating_dialog.dart';

class TopScreenFileRegistration extends StatefulWidget {
  static const String id = 'top_screen_file_registration';

  TopScreenFileRegistration(this.uploadType);

  final Upload uploadType;

  @override
  _TopScreenFileRegistrationState createState() =>
      _TopScreenFileRegistrationState();
}

class _TopScreenFileRegistrationState extends State<TopScreenFileRegistration> {
  File _selectedFile;

  //Render PDF at 100 dpi
  static const _pdfScale = 100.0 / 72.0;

  void _selectImage() async {
    _selectedFile = await FilePicker.getFile(type: FileType.IMAGE);

    if (_selectedFile == null)
      Routes.sailor.pop();
    else if (_selectedFile != null) setState(() {});
  }

  void _selectPdf() async {
    _selectedFile =
        await FilePicker.getFile(type: FileType.CUSTOM, fileExtension: 'pdf');

    if (_selectedFile == null)
      Routes.sailor.pop();
    else if (_selectedFile != null) setState(() {});
  }

  void _selectCameraImage() async {
    _selectedFile = await ImagePicker.pickImage(source: ImageSource.camera);

    if (_selectedFile == null)
      Routes.sailor.pop();
    else if (_selectedFile != null) setState(() {});
  }

//              _selectedFile = await FilePicker.getFile(type: FileType.IMAGE);
//
//              if (_selectedFile != null) {
//                _selectedFile.copySync(_examsDirectory.path +
//                    '/' +
//                    _newFileName +
//                    '.' +
//                    _selectedFile.path.split('.').last);
//              }

  @override
  void initState() {
    super.initState();

    //Open the Documents/Camera depending on the action the user chose before
    switch (widget.uploadType) {
      case Upload.image:
        _selectImage();
        break;
      case Upload.pdf:
        _selectPdf();
        break;
      case Upload.camera:
        _selectCameraImage();
        break;
      default:
        Routes.sailor.pop();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    //Responsive Function => WidthPercentage(1.0%)
    final Function wp = Responsive(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height)
        .wp;
    final Function hp = Responsive(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height)
        .hp;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Novo Upload',
          style: TextStyle(color: kSigaMed),
        ),
        flexibleSpace: Image.asset(
          'images/background.jpg',
          fit: BoxFit.cover,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              //TODO FIX HERE
              final form = GlobalKeys.fileRegistrationFormKey.currentState;

              if (form.saveAndValidate()) {
                print(form.fields['name'].currentState.value);
                print(form.fields['date'].currentState.value);

                print(form.fields['description'].currentState.value);
                print(form.fields['main_folders'].currentState.value);
                if (form.fields['secondary_folders'] != null)
                  print(form.fields['secondary_folders'].currentState.value);
                if (form.fields['final_folders_image'] != null)
                  print(form.fields['final_folders_image'].currentState.value);
                if (form.fields['final_folders_lab'] != null)
                  print(form.fields['final_folders_lab'].currentState.value);
                validatingDialog(context);
                await Future.delayed(Duration(seconds: 3));
                Routes.sailor.pop();
                Routes.sailor.pop();
              } else {
                validatingDialog(context);
                await Future.delayed(Duration(milliseconds: 500));
                Routes.sailor.pop();
                Snackbars.flushbarFormError(context).show(context);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopScreenFileRegistrationForm(),
            //Show the image/PDF that the user just loaded
            Builder(
              builder: (context) {
                if (_selectedFile != null) {
                  //Get the file format from the path
                  String fileExtension =
                      _selectedFile.path.split('.').last.toLowerCase();
                  bool isPdf = fileExtension == 'pdf';

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: wp(15.0),
                          right: wp(15.0),
                          top: wp(5.0),
                          bottom: wp(1.0),
                        ),
                        child: Text(
                          'Pré-Visualização',
                          style: TextStyle(color: kBlack26),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: wp(5.0),
                            left: wp(10.0),
                            right: wp(10.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(wp(8.0)),
                            child: isPdf
                                ? PdfDocumentLoader(
                                    filePath: _selectedFile.path,
                                    pageNumber: 1,
                                    calculateSize:
                                        (pageWidth, pageHeight, aspectRatio) {
                                      switch (
                                          MediaQuery.of(context).orientation) {
                                        case Orientation.portrait:
                                          return Size(
                                              (pageWidth * _pdfScale) *
                                                  aspectRatio,
                                              wp(100.0));
                                          break;
                                        case Orientation.landscape:
                                          return Size(
                                              hp(100.0),
                                              (pageHeight * _pdfScale) *
                                                  aspectRatio);
                                          break;
                                        default:
                                          return null;
                                      }
                                    },
                                  )
                                : Image.file(
                                    _selectedFile,
                                    width: wp(100.0),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else
                  return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
