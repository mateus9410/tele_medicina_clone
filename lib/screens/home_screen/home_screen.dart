import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sigamed_tele_medicina/screens/center_screen/center_screen.dart';
import 'package:sigamed_tele_medicina/screens/home_screen/home_screen_menu_icon.dart';
import 'package:sigamed_tele_medicina/screens/top_screen/top_screen.dart';
import 'package:sigamed_tele_medicina/utilities/constants.dart';
import 'package:sigamed_tele_medicina/utilities/responsive.dart';
import 'package:sigamed_tele_medicina/utilities/routes.dart';

enum Menu { top, center, left, right, bottom }

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String _mainDirectoryName = '/Siga_Telemedicina';
  Directory _mainDirectory;

  final List<String> foldersList = [
    '/Exames/Imagem/RM - Ressonância Magnética',
    '/Exames/Imagem/TC - Tomografia Computadorizada',
    '/Exames/Imagem/RX - Raio-X',
    '/Exames/Imagem/US - Ultrassonografia',
    '/Exames/Imagem/MG - Mamografia',
    '/Exames/Imagem/DO - Dessitometria Óssea',
    '/Exames/Imagem/MN - Medicina Nuclear',
    '/Exames/Imagem/PET-CT - Tomografia',
    '/Exames/Imagem/Endoscopia',
    '/Exames/Imagem/Cateterismo',
    '/Exames/Imagem/Oftalmologia',
    '/Exames/Laboratorial/Anatomia Patológica',
    '/Exames/Laboratorial/Análise Clínica',
    '/Exames/Laboratorial/Genética',
    '/Consultas',
    '/Receitas',
    '/Pedidos de Exame',
    '/Cirugias',
    '/Internações',
    '/Outros',
    '/Check-up',
    '/Lixeira',
  ];

  void _getFolders() async {
    //Ask for READ permission of the external storage
    await PermissionHandler()
        .requestPermissions([PermissionGroup.storage, PermissionGroup.camera]);

    //Get the main "Application Documents" folder location
    _mainDirectory = await getApplicationDocumentsDirectory();
    _mainDirectory = await Directory(_mainDirectory.path + _mainDirectoryName)
        .create(recursive: true);

    //Create all necessary folders inside the "Application Documents"
    for (String folder in foldersList)
      await Directory(_mainDirectory.path + folder).create(recursive: true);
  }

  @override
  void initState() {
    super.initState();
    _getFolders();
  }

  @override
  Widget build(BuildContext context) {
    //Responsive Function => WidthPercentage(1.0%)
    final Function wp = Responsive(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height)
        .wp;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhite,
        centerTitle: true,
        title: Hero(
          tag: 'clip',
          child: Image.asset(
            'images/sigamed_tele_logo.png',
            height: wp(8.0),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.signOutAlt),
            onPressed: Routes.sailor.pop,
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: _buildMenu(context),
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.jpg'), fit: BoxFit.cover)),
      child: CustomMultiChildLayout(
        delegate: MenuLayoutDelegate(
          position: Offset(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height),
        ),
        children: <Widget>[
          LayoutId(
            id: Menu.top,
            child: HomeScreenMenuIcon(
              icon: FontAwesomeIcons.fileUpload,
              color: kWhite,
              title: 'Enviar\nArquivos',
              onPressed: () => Routes.sailor.navigate(TopScreen.id),
            ),
          ),
          LayoutId(
            id: Menu.left,
            child: HomeScreenMenuIcon(
              icon: FontAwesomeIcons.heartbeat,
              color: kWhite,
              title: 'Saúde',
            ),
          ),
          LayoutId(
            id: Menu.center,
            child: HomeScreenMenuIcon(
              icon: FontAwesomeIcons.history,
              color: kWhite,
              title: 'Histórico',
              onPressed: () => Routes.sailor.navigate(CenterScreen.id),
            ),
          ),
          LayoutId(
            id: Menu.right,
            child: HomeScreenMenuIcon(
              icon: FontAwesomeIcons.calendarCheck,
              color: kWhite,
              title: 'Agenda',
            ),
          ),
          LayoutId(
            id: Menu.bottom,
            child: HomeScreenMenuIcon(
              icon: FontAwesomeIcons.userMd,
              color: kWhite,
              title: 'Tele\nConsulta',
            ),
          ),
        ],
      ),
    );
  }
}

class MenuLayoutDelegate extends MultiChildLayoutDelegate {
  MenuLayoutDelegate({this.position});

  final Offset position;
  final double yPosition = 0.45;

  @override
  void performLayout(Size size) {
    if (hasChild(Menu.top)) {
      final topSize = layoutChild(
        Menu.top,
        BoxConstraints.loose(size),
      );

      positionChild(
        Menu.top,
        Offset(position.dx * 0.5 - topSize.width * 0.5,
            position.dy * yPosition - topSize.height * 2),
      );
    }

    if (hasChild(Menu.left)) {
      final leftSize = layoutChild(
        Menu.left,
        BoxConstraints.loose(size),
      );

      positionChild(
        Menu.left,
        Offset(position.dx * 0.5 - leftSize.width * 2,
            position.dy * yPosition - leftSize.height * 0.5),
      );
    }

    if (hasChild(Menu.center)) {
      final centerSize = layoutChild(
        Menu.center,
        BoxConstraints.loose(size),
      );

      positionChild(
        Menu.center,
        Offset(position.dx * 0.5 - centerSize.width * 0.5,
            position.dy * yPosition - centerSize.height * 0.5),
      );
    }

    if (hasChild(Menu.right)) {
      final rightSize = layoutChild(
        Menu.right,
        BoxConstraints.loose(size),
      );

      positionChild(
        Menu.right,
        Offset(position.dx * 0.5 + rightSize.width,
            position.dy * yPosition - rightSize.height * 0.5),
      );
    }

    if (hasChild(Menu.bottom)) {
      final bottomSize = layoutChild(
        Menu.bottom,
        BoxConstraints.loose(size),
      );

      positionChild(
        Menu.bottom,
        Offset(position.dx * 0.5 - bottomSize.width * 0.5,
            position.dy * yPosition + bottomSize.height),
      );
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}
