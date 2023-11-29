import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:treinamento/widgets/custom_button.dart';
import 'package:treinamento/widgets/custom_textfield.dart';
import 'package:treinamento/widgets/edit_person.dart';
import 'package:treinamento/widgets/footer.dart';
import 'package:treinamento/widgets/header.dart';
import 'package:treinamento/widgets/remove_popup.dart';
import 'package:treinamento/widgets/users_list.dart';
import 'package:treinamento/database/db_connection.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
              Header(totalResultados: pessoas.length,),

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
                    await RemovePopup(context, pessoas[index]['id_user'], pessoas[index]['user_name']);
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
                  controllerTelephone: controllerTelephone
                ),
            ],
          ),
        ),
    );
  }
}