import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sigamed_tele_medicina/utilities/constants.dart';
import 'package:sigamed_tele_medicina/utilities/responsive.dart';
import 'package:sigamed_tele_medicina/widgets/searche_dialog.dart';

class CenterScreen extends StatefulWidget {
  static const String id = 'center_screen';

  @override
  _CenterScreenState createState() => _CenterScreenState();
}

class _CenterScreenState extends State<CenterScreen> {
  static const String _mainDirectoryName = '/Siga_Telemedicina';
  Directory _mainDirectory;

  Future<List<String>> _initializeFolders() async {
    //Get the main "Application Documents" folder location
    _mainDirectory = await getApplicationDocumentsDirectory();
    _mainDirectory = Directory(_mainDirectory.path + _mainDirectoryName);

    List<String> foldersPaths = [];

    //Observes de directory for any files
    await _mainDirectory
        .list(followLinks: true)
        .listen((FileSystemEntity entity) {
      //Add each file path in a list to be displayed
      foldersPaths.add(entity.path);
    }).asFuture();

    return foldersPaths;
  }

  @override
  Widget build(BuildContext context) {
    //Responsive Function => WidthPercentage(1.0%)
    final Function wp = Responsive(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height)
        .wp;

    _openSearch(String currentSearch) async {
      final String search = await showDialog(
        context: context,
        builder: (context) => SearchDialog(currentSearch: currentSearch),
      );
    }

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _openSearch("");
            },
          )
        ],
      ),
      body: Center(
        child: _buildFoldersList(context),
      ),
    );
  }

  Widget _buildFoldersList(BuildContext context) {
    //Responsive Function => WidthPercentage(1.0%)
    final Function wp = Responsive(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height)
        .wp;

    return FutureBuilder<List<String>>(
      future: _initializeFolders(),
      builder: (context, snapshot) {
        if (snapshot.data != null && snapshot.data.isNotEmpty) {
          List<String> foldersPaths = snapshot.data;
          return ListView.builder(
            itemCount: foldersPaths.length,
            itemBuilder: (context, index) => Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.folder_open),
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: wp(5.0)),
                    child: Text(foldersPaths[index].split('/').last),
                  ),
                  onTap: () {},
                ),
                Divider(
                  height: 0.0,
                  color: kBlack26,
                  indent: wp(17.0),
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
