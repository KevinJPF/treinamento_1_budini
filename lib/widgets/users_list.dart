import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';

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
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              // color: AppTheme.customColors['dark-blue-100'],
              // borderRadius: BorderRadius.circular(10),
              border: Border(bottom: BorderSide(color: AppTheme.customColors['white-24']!,width: 1.0))
            ),
            child: Stack(
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${pessoas[index]['user_name']}',
                          style: TextStyle(color: AppTheme.customColors['white-100']),
                        ),
                      ),
                      SizedBox(width: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${pessoas[index]['user_address'].toString()}',
                          style: TextStyle(color: AppTheme.customColors['white-100']),
                        ),
                      ),
                      SizedBox(width: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${pessoas[index]['user_phone'].toString()}',
                          style: TextStyle(color: AppTheme.customColors['white-100']),
                        ),
                      ),
                    ],
                  ),
                ),

              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Container(
              //         width: 50,
              //         height: 30,
              //         decoration: BoxDecoration(
              //           color: AppTheme.customColors['red-100'],
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child:
              //         ElevatedButton(
              //           onPressed: () {onPressedEdit(index);},
              //           style: ButtonStyle(
              //               padding: MaterialStateProperty.all(EdgeInsets.zero),
              //               backgroundColor: MaterialStatePropertyAll(
              //               AppTheme.customColors['red-100'],
              //             ),
              //           ),
              //           child: Icon(
              //               CupertinoIcons.pencil,
              //               color: AppTheme.customColors['white-100'],
              //               size: 20,
              //             ),
              //         ),
              //       ),
              //       Spacer(),
              //       Container(
              //         width: 50,
              //         height: 30,
              //         decoration: BoxDecoration(
              //           color: AppTheme.customColors['red-100'],
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child:
              //         ElevatedButton(
              //           onPressed: () {onPressedDelete(index);},
              //           style: ButtonStyle(
              //               padding: MaterialStateProperty.all(EdgeInsets.zero),
              //               backgroundColor: MaterialStatePropertyAll(
              //               AppTheme.customColors['red-100'],
              //             ),
              //             minimumSize: MaterialStateProperty.all(
              //             Size(50, 30)),
              //           ),
              //           child: Icon(
              //               CupertinoIcons.delete,
              //               color: AppTheme.customColors['white-100'],
              //               size: 20,
              //             ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              ],
            ),
          );
        },
      ),
    );
  }
}