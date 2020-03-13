import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:sigamed_tele_medicina/utilities/constants.dart';
import 'package:sigamed_tele_medicina/utilities/global_keys.dart';
import 'package:sigamed_tele_medicina/utilities/responsive.dart';

class TopScreenFileRegistrationForm extends StatefulWidget {
  @override
  _TopScreenFileRegistrationFormState createState() =>
      _TopScreenFileRegistrationFormState();
}

class _TopScreenFileRegistrationFormState
    extends State<TopScreenFileRegistrationForm> {
  DateFormat _dateFormat;

  //Bools for the folder selection
  bool _mainFolderExams = false;
  bool _secondaryFolderImage = false;

  @override
  void initState() {
    super.initState();

    initializeDateFormatting();
    _dateFormat = DateFormat('dd/MM/yyyy');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Responsive Function => WidthPercentage(1.0%)
    final Function wp = Responsive(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height)
        .wp;

    return FormBuilder(
      autovalidate: true,
      key: GlobalKeys.fileRegistrationFormKey,
      initialValue: {
        'name': '',
        'date': DateTime.now(),
        'description': '',
        'main_folders': 'Consultas',
        'secondary_folders': 'Imagem',
        'final_folders_image': 'RM - Ressonância Magnética',
        'final_folders_lab': 'Anatomia Patológica',
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: wp(15.0),
            right: wp(15.0),
            top: wp(5.0),
            bottom: wp(1.0),
          ),
          child: Text(
            'Nome do Arquivo *',
            style: TextStyle(color: kBlack26),
          ),
        ),
        Container(
          height: wp(13.0),
          padding: EdgeInsets.symmetric(horizontal: wp(4.0)),
          margin: EdgeInsets.symmetric(horizontal: wp(10.0)),
          decoration: BoxDecoration(
              border: Border.all(color: kBlack26),
              borderRadius: BorderRadius.all(Radius.circular(wp(6.0)))),
          child: FormBuilderTextField(
            maxLines: 1,
            attribute: 'name',
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            validators: [
              FormBuilderValidators.required(errorText: '* Campo Obrigatório.')
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: wp(15.0),
            right: wp(15.0),
            top: wp(5.0),
            bottom: wp(1.0),
          ),
          child: Text(
            'Data de Realização *',
            style: TextStyle(color: kBlack26),
          ),
        ),
        Container(
          height: wp(13.0),
          padding: EdgeInsets.symmetric(horizontal: wp(4.0)),
          margin: EdgeInsets.symmetric(horizontal: wp(10.0)),
          decoration: BoxDecoration(
              border: Border.all(color: kBlack26),
              borderRadius: BorderRadius.all(Radius.circular(wp(6.0)))),
          child: FormBuilderDateTimePicker(
            attribute: 'date',
            initialDate: DateTime(1900, 01, 01),
            lastDate: DateTime.now(),
            inputType: InputType.date,
            format: _dateFormat,
            decoration: InputDecoration(border: InputBorder.none),
            validators: [
              FormBuilderValidators.required(errorText: '* Campo Obrigatório.')
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: wp(15.0),
            right: wp(15.0),
            top: wp(5.0),
            bottom: wp(1.0),
          ),
          child: Text(
            'Descrição *',
            style: TextStyle(color: kBlack26),
          ),
        ),
        Container(
          height: wp(13.0),
          padding: EdgeInsets.symmetric(horizontal: wp(4.0)),
          margin: EdgeInsets.symmetric(horizontal: wp(10.0)),
          decoration: BoxDecoration(
              border: Border.all(color: kBlack26),
              borderRadius: BorderRadius.all(Radius.circular(wp(6.0)))),
          child: FormBuilderTextField(
            maxLines: 1,
            attribute: 'description',
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            validators: [
              FormBuilderValidators.required(errorText: '* Campo Obrigatório.')
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: wp(15.0),
            right: wp(15.0),
            top: wp(5.0),
            bottom: wp(1.0),
          ),
          child: Text(
            'Pasta *',
            style: TextStyle(color: kBlack26),
          ),
        ),
        Container(
          height: wp(13.0),
          padding: EdgeInsets.symmetric(horizontal: wp(4.0)),
          margin: EdgeInsets.symmetric(horizontal: wp(10.0)),
          decoration: BoxDecoration(
              border: Border.all(color: kBlack26),
              borderRadius: BorderRadius.all(Radius.circular(wp(6.0)))),
          child: FormBuilderDropdown(
            attribute: 'main_folders',
            decoration: InputDecoration(border: InputBorder.none),
            items: [
              'Exames',
              'Consultas',
              'Receitas',
              'Pedidos de Exame',
              'Cirurgias',
              'Internações',
              'Outros',
              'Check-up',
            ]
                .map(
                  (folders) => DropdownMenuItem(
                    value: folders,
                    child: Text(folders),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == 'Exames') {
                setState(() {
                  _mainFolderExams = true;
                  _secondaryFolderImage = true;
                });
              } else {
                setState(() {
                  _mainFolderExams = false;
                  _secondaryFolderImage = false;
                });
              }
            },
          ),
        ),
        _mainFolderExams
            ? Container(
                height: wp(13.0),
                padding: EdgeInsets.symmetric(horizontal: wp(4.0)),
                margin: EdgeInsets.symmetric(
                    horizontal: wp(10.0), vertical: wp(2.0)),
                decoration: BoxDecoration(
                    border: Border.all(color: kBlack26),
                    borderRadius: BorderRadius.all(Radius.circular(wp(6.0)))),
                child: FormBuilderDropdown(
                  attribute: 'secondary_folders',
                  decoration: InputDecoration(border: InputBorder.none),
                  items: [
                    'Imagem',
                    'Laboratorial',
                  ]
                      .map(
                        (folders) => DropdownMenuItem(
                          value: folders,
                          child: Text(folders),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == 'Imagem') {
                      setState(() {
                        _secondaryFolderImage = true;
                      });
                    } else if (value == 'Laboratorial') {
                      setState(() {
                        _secondaryFolderImage = false;
                      });
                    }
                  },
                ),
              )
            : Container(),
        _mainFolderExams
            ? _secondaryFolderImage
                ? Container(
                    height: wp(13.0),
                    padding: EdgeInsets.symmetric(horizontal: wp(4.0)),
                    margin: EdgeInsets.symmetric(horizontal: wp(10.0)),
                    decoration: BoxDecoration(
                        border: Border.all(color: kBlack26),
                        borderRadius:
                            BorderRadius.all(Radius.circular(wp(6.0)))),
                    child: FormBuilderDropdown(
                      attribute: 'final_folders_image',
                      decoration: InputDecoration(border: InputBorder.none),
                      items: [
                        'RM - Ressonância Magnética',
                        'TC - Tomografia Computadorizada',
                        'RX - Raio-X',
                        'US - Ultrassonografia',
                        'MG - Mamografia',
                        'DO - Dessitometria Óssea',
                        'MN - Medicina Nuclear',
                        'PET/CT',
                        'Endoscopia',
                        'Cateterismo',
                        'Oftalmologia',
                      ]
                          .map(
                            (folders) => DropdownMenuItem(
                              value: folders,
                              child: Text(folders),
                            ),
                          )
                          .toList(),
                    ),
                  )
                : Container()
            : Container(),
        _mainFolderExams
            ? _secondaryFolderImage
                ? Container()
                : Container(
                    height: wp(13.0),
                    padding: EdgeInsets.symmetric(horizontal: wp(4.0)),
                    margin: EdgeInsets.symmetric(horizontal: wp(10.0)),
                    decoration: BoxDecoration(
                        border: Border.all(color: kBlack26),
                        borderRadius:
                            BorderRadius.all(Radius.circular(wp(6.0)))),
                    child: FormBuilderDropdown(
                      attribute: 'final_folders_lab',
                      decoration: InputDecoration(border: InputBorder.none),
                      items: [
                        'Anatomia Patológica',
                        'Análise Clínica',
                        'Genética',
                      ]
                          .map(
                            (folders) => DropdownMenuItem(
                              value: folders,
                              child: Text(folders),
                            ),
                          )
                          .toList(),
                    ),
                  )
            : Container(),
      ]),
    );
  }
}
