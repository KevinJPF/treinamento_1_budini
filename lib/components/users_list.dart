import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersList extends StatelessWidget {
  // final List<Map<String, dynamic>> pessoas = [  ];
  final void Function(int) onPressedEdit;
  final void Function(int) onPressedDelete;
  final List<Map<String, dynamic>> pessoas;

  const UsersList({super.key, required this.pessoas, required this.onPressedEdit, required this.onPressedDelete});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: pessoas.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 187, 187, 187),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                ListTile(
                  title: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Nome: ${pessoas[index]['user_name']}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Endereço: ${pessoas[index]['user_address'].toString()}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Telefone: ${pessoas[index]['user_phone'].toString()}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              Positioned(
                top: 0,
                right: 10,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:
                        ElevatedButton(
                          onPressed: () {onPressedEdit(index);},
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.zero),
                              backgroundColor: MaterialStatePropertyAll(
                              Colors.pink,
                            ),
                          ),
                          child: const Icon(
                              CupertinoIcons.pencil,
                              color: Colors.white,
                              size: 20,
                            ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:
                        ElevatedButton(
                          onPressed: () {onPressedDelete(index);},
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.zero),
                              backgroundColor: const MaterialStatePropertyAll(
                              Colors.pink,
                            ),
                            minimumSize: MaterialStateProperty.all(
                            Size(50, 30)),
                          ),
                          child: const Icon(
                              CupertinoIcons.delete,
                              color: Colors.white,
                              size: 20,
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ],
            ),
          );
        },
      ),
    );
  }
}