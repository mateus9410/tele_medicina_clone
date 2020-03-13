import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sigamed_tele_medicina/screens/top_screen/top_screen_file_registration.dart';
import 'package:sigamed_tele_medicina/utilities/constants.dart';
import 'package:sigamed_tele_medicina/utilities/responsive.dart';
import 'package:sigamed_tele_medicina/utilities/routes.dart';

enum Upload { image, pdf, camera }

class TopScreen extends StatefulWidget {
  static const String id = 'top_screen';

  @override
  _TopScreenState createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  static const String _mainDirectoryName = '/Siga_Telemedicina';
  Directory _mainDirectory;

  void initializeFolders() async {
    //Get the main "Application Documents" folder location
    _mainDirectory = await getApplicationDocumentsDirectory();
    _mainDirectory = await Directory(_mainDirectory.path + _mainDirectoryName)
        .create(recursive: true);
  }

  void _uploadOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.file_upload),
              title: Text('Fazer Upload de Foto'),
              onTap: () {
                Routes.sailor.pop();
                Routes.sailor.navigate(TopScreenFileRegistration.id,
                    params: {'upload': Upload.image});
              },
            ),
            ListTile(
              leading: Icon(Icons.picture_as_pdf),
              title: Text('Fazer Upload de PDF'),
              onTap: () {
                Routes.sailor.pop();
                Routes.sailor.navigate(TopScreenFileRegistration.id,
                    params: {'upload': Upload.pdf});
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Usar a Câmera'),
              onTap: () {
                Routes.sailor.pop();
                Routes.sailor.navigate(TopScreenFileRegistration.id,
                    params: {'upload': Upload.camera});
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    initializeFolders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Responsive Function => WidthPercentage(1.0%)
    final Function wp = Responsive(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height)
        .wp;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'images/sigamed_tele_logo.png',
          height: wp(8.0),
        ),
        flexibleSpace: Image.asset(
          'images/background.jpg',
          fit: BoxFit.cover,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: kWhite),
        onPressed: () => _uploadOptionsBottomSheet(context),
      ),
      body: Center(
        //BLoC should decide here what to render:
        //Empty box with simple instructions or
        //the list with files to be uploaded
        child: _buildEmptyFilesList(context),
      ),
    );
  }

  Widget _buildEmptyFilesList(BuildContext context) {
    //Responsive Function => WidthPercentage(1.0%)
    final Function wp = Responsive(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height)
        .wp;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(wp(5.0)),
          child: Image.asset('images/empty.png', width: wp(40.0)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: wp(5.0)),
          child: Text(
            'Nenhum arquivo para upload pendente.\n'
            'Clique no botão + para adicionar um arquivo.',
            textAlign: TextAlign.center,
            style: TextStyle(color: kGrey600),
          ),
        )
      ],
    );
  }
}
