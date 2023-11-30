import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';

class SwitchCustom extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const SwitchCustom({Key? key, required this.text, required this.onPressed}) : super(key: key);


  @override
  _SwitchCustomState createState() => _SwitchCustomState();
}

class _SwitchCustomState extends State<SwitchCustom> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width),
      constraints: const BoxConstraints(
        minHeight: 48.0,
      ),
      // color: Colors.yellow,
      child: Row(
        children: [
          Container (
            width: (MediaQuery.of(context).size.width - 103),
            constraints: const BoxConstraints(
              minHeight: 48.0,
            ),
            margin: EdgeInsets.symmetric(horizontal: 16),
            // color: Colors.blue,
            child: Align (
              alignment: Alignment.centerLeft,
              child: Text (
                widget.text, 
                style: AppTheme.customTextStyles['medium-20']
              ),
            ),
          ),
          Container (
            width: (55),
            height: 30,
            // color: Colors.green,
            child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor: MaterialStatePropertyAll(
                      isSwitched ? AppTheme.customColors['activated-switch'] : AppTheme.customColors['deactivated-switch'],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isSwitched = !isSwitched;
                      print(isSwitched);
                      widget.onPressed();
                    });
                  },
                  child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: isSwitched ? 100.0 : 100.0,
                  alignment: isSwitched ? Alignment.centerRight : Alignment.centerLeft,
                  padding: EdgeInsets.zero,
                  child: Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: AppTheme.customColors['white-100'],
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.customColors['black-28']!,
                          offset: Offset(0, 5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    height: 26,
                    width: 26,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  
  bool getSwitchedState() {
    return isSwitched;
  }
}