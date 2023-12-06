import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:treinamento/widgets/edit_person.dart';
import 'package:treinamento/widgets/footer.dart';
import 'package:treinamento/widgets/header.dart';
import 'package:treinamento/widgets/header_users.dart';
import 'package:treinamento/widgets/remove_popup.dart';
import 'package:treinamento/widgets/subheader.dart';
import 'package:treinamento/widgets/users_list.dart';
import 'package:treinamento/database/db_connection.dart';

class PeopleList extends StatefulWidget {
  const PeopleList({super.key});

  @override
  State<PeopleList> createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  final DatabaseConnection database = DatabaseConnection();
  final controllerUserName = TextEditingController();
  final controllerAddress = TextEditingController();
  final controllerTelephone = TextEditingController();
  List<Map<String, dynamic>> pessoas = [];

  @override
  void initState() {
    super.initState();
    carregarPessoas();
  }

  void carregarPessoas() {
    database.getUsuarios().then((result) {
      setState(() {
        pessoas = result.reversed.toList();
        print('resultado: ${result}');
        print('pessoas: ${pessoas}');
      });
    });
  }

  void adicionarPessoa(Map<String, dynamic> novaPessoa) {
    setState(() {
      database.insertItem(novaPessoa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.customColors['background-top']!,
              AppTheme.customColors['background-bottom']!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Header(
              tituloHeader: 'Pessoas',
              hasLeftIcon: true,
              leftIcon: CupertinoIcons.xmark,
              hasRightIcon: false,
              onPressedLeft: () {
                Navigator.of(context).pop();
              },
            ),
            SubHeader(totalResultados: pessoas.length),
            UsersList(
              pessoas: pessoas,
              onPressedEdit: (int index) async {
                //print('user: ${pessoas[index]}');
                await EditPerson(context, pessoas[index]);
                carregarPessoas();
              },
              onPressedDelete: (int index) async {
                print('pessoa: ${pessoas[index]}');
                print('id_user: ${pessoas[index]['id_user']}');
                await RemovePopup(context, pessoas[index]['id_user'],
                    pessoas[index]['user_name']);
                carregarPessoas();
              },
            ),
            Footer(
                onPressed: () async {
                  if (!controllerUserName.text.isEmpty) {
                    adicionarPessoa({
                      'user_name': controllerUserName.text,
                      'user_address': controllerAddress.text,
                      'user_phone': controllerTelephone.text,
                      'date_time': DateFormat('HH:mm').format(DateTime.now()),
                    });
                  }
                  controllerUserName.clear();
                  controllerAddress.clear();
                  controllerTelephone.clear();
                  carregarPessoas();
                  String path = await database.databasePath;
                  print('Caminho do banco de dados: $path');
                },
                controllerUserName: controllerUserName,
                controllerAddress: controllerAddress,
                controllerTelephone: controllerTelephone),
          ],
        ),
      ),
    );
  }
}
