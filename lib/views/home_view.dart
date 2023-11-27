import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:treinamento/components/custom_button.dart';
import 'package:treinamento/components/custom_textfield.dart';
import 'package:treinamento/components/users_list.dart';
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
        pessoas = result;
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
  
  void removerPessoa(int indexPessoa) {
    setState(() {
      database.deleteItem(indexPessoa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Usuários'),
          backgroundColor: Color.fromARGB(255, 28, 28, 28),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 28, 28, 28),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              CustomTextField(controllerText: controllerUserName, hintText: 'Nome', isPassword: false, removeSpaces: false),
              SizedBox(height: 10),
              CustomTextField(controllerText: controllerAddress, hintText: 'Endereço', isPassword: false, removeSpaces: false),
              SizedBox(height: 10),
              CustomTextField(controllerText: controllerTelephone, hintText: 'Telefone', isPassword: false, removeSpaces: false),
              SizedBox(height: 10),
              CustomButton(buttonText: 'Cadastrar', 
              onPressed: () async {
                if (!controllerUserName.text.isEmpty) {
                      adicionarPessoa({
                      'user_name': controllerUserName.text, 
                      'user_address': controllerAddress.text,
                      'user_phone': controllerTelephone.text
                    });
                  }
                  controllerUserName.clear();
                  controllerAddress.clear();
                  controllerTelephone.clear();
                  carregarPessoas();
                  String path = await database.databasePath;
                  print('Caminho do banco de dados: $path');
                },
              ),
              SizedBox(height: 30),
              UsersList(
                pessoas: pessoas, 
                onPressedEdit: (int index) async {
                    print('id_user: ${pessoas[index]['id_user']}');
                    await _exibirPopupEdicao(context, index);
                    carregarPessoas();
                },
                onPressedDelete: (int index) {
                    print('pessoa: ${pessoas[index]}');
                    print('id_user: ${pessoas[index]['id_user']}');
                    removerPessoa(pessoas[index]['id_user']);
                    carregarPessoas();
                },
              ),
            ],
          ),
        ),
    );
  }

Future<void> _exibirPopupEdicao(BuildContext context, int index) async {
    TextEditingController nomeController = TextEditingController();
    TextEditingController enderecoController = TextEditingController();
    TextEditingController telefoneController = TextEditingController();


    final int idUser = pessoas[index]['id_user'];
    nomeController.text = pessoas[index]['user_name'];
    enderecoController.text = pessoas[index]['user_address'];
    telefoneController.text = pessoas[index]['user_phone'];

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Editar Usuário')),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          content: SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            height: MediaQuery.of(context).size.height - 700,
            child: Column(
              children: [
                CustomTextField(controllerText: nomeController, hintText: 'Nome', isPassword: false, removeSpaces: false),
                const SizedBox(height: 10),
                CustomTextField(controllerText: enderecoController, hintText: 'Endereço', isPassword: false, removeSpaces: false),
                const SizedBox(height: 10),
                CustomTextField(controllerText: telefoneController, hintText: 'Telefone', isPassword: false, removeSpaces: false),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Atualize os valores no item da lista
                setState(() {
                  final Map<String, dynamic> pessoaAtualizada = 
                    {'id_user': idUser, 'user_name': nomeController.text, 'user_address': enderecoController.text, 'user_phone': telefoneController.text,};
                    print(pessoaAtualizada);
                  database.updateItem(pessoaAtualizada);
                  // pessoas[index]['user_name'] = nomeController.text;
                  // pessoas[index]['user_address'] = enderecoController.text;
                  // pessoas[index]['user_phone'] = telefoneController.text;
                });
                Navigator.pop(context);
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}