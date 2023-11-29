import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';

class UsersList extends StatefulWidget {

  final void Function(int) onPressedEdit;
  final void Function(int) onPressedDelete;
  final List<Map<String, dynamic>> pessoas;

  const UsersList({super.key, required this.pessoas, required this.onPressedEdit, required this.onPressedDelete});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
      padding: const EdgeInsets.only(bottom: 16),
        // reverse: true,
        itemCount: widget.pessoas.length,
        itemBuilder: (context, index) {
          return Container(
            // color: Colors.amber,
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Stack(
                      children: [
                        Container(
                          // color: Colors.white,
                          constraints: const BoxConstraints(
                            minHeight: 48.0,
                          ),
                          height: 48,
                          margin: const EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            children: [
                                              Container(
                                                alignment: Alignment.bottomLeft,
                                                margin: const EdgeInsets.only(right: 16),
                                                // color: Colors.blue,
                                                child: Text(
                                                  '${widget.pessoas[index]['user_name']}',
                                                style: selectedIndex == index ? AppTheme.customTextStyles['medium-16-highlight'] : AppTheme.customTextStyles['medium-16'],
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  '${widget.pessoas[index]['date_time']}',
                                                  // '15:37',
                                                  style: selectedIndex == index ? AppTheme.customTextStyles['regular-11-highlight'] : AppTheme.customTextStyles['regular-11'],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.bottomLeft,
                                            margin: const EdgeInsets.only(right: 16),
                                            // color: Colors.blue,
                                            child: Text(
                                              '${widget.pessoas[index]['user_address'].toString()}',
                                                style: selectedIndex == index ? AppTheme.customTextStyles['medium-16-highlight'] : AppTheme.customTextStyles['medium-16'],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            // color: Colors.lightBlue,
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                '${widget.pessoas[index]['user_phone'].toString()}',
                                                style: selectedIndex == index ? AppTheme.customTextStyles['medium-16-highlight'] : AppTheme.customTextStyles['medium-16'],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ),
                              ),
                                        
                              Container(
                                // color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      constraints: const BoxConstraints(
                                        minWidth: 4.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 48,
                                      height: 48,
                                      child:
                                      ElevatedButton(
                                        onPressed: () {
                                            selectedIndex = index;
                                            widget.onPressedEdit(index);
                                          },
                                        style: ButtonStyle(
                                            elevation: MaterialStateProperty.all<double>(0),
                                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                                            backgroundColor: const MaterialStatePropertyAll(
                                            Colors.transparent,
                                          ),
                                          shape: MaterialStateProperty.all<OutlinedBorder>(
                                            const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ),
                                          ),
                                        ),
                                        child: Icon(
                                          CupertinoIcons.pencil_outline,
                                          color: AppTheme.customColors['principal-100'],
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 48,
                                      height: 48,
                                      child:
                                      ElevatedButton(
                                        onPressed: () {
                                          selectedIndex = index;
                                          widget.onPressedDelete(index);
                                        },
                                        style: ButtonStyle(
                                            elevation: MaterialStateProperty.all<double>(0),
                                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                                            backgroundColor: const MaterialStatePropertyAll(
                                            Colors.transparent,
                                          ),
                                          shape: MaterialStateProperty.all<OutlinedBorder>(
                                            const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ),
                                          ),
                                          minimumSize: MaterialStateProperty.all(
                                          const Size(48, 48)),
                                        ),
                                        child: Icon(
                                            CupertinoIcons.xmark,
                                            color: AppTheme.customColors['red-100'],
                                            size: 24,
                                          ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                  Container( // Container criado para linha inferior
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 47),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                  // color: Colors.pink,
                      border: Border(bottom: BorderSide(color: AppTheme.customColors['white-24']!,width: 1.0))
                    ),
                  ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}