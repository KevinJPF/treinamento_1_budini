import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';

class NumberList extends StatefulWidget {
  final int numberQuantity;

  const NumberList({Key? key, required this.numberQuantity}) : super(key: key);

  @override
  _NumberListState createState() => _NumberListState();
}

class _NumberListState extends State<NumberList> {
  late ScrollController _scrollController;
  late int _currentNumber;
  late int totalNumbers;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: 1000 * 60.0,
    );
    _currentNumber = 1;
    totalNumbers = widget.numberQuantity;
  }

  void _updateCurrentNumber(bool stopScroll) {
    final centerIndex = (_scrollController.offset / 60).round();
    final newNumber = ((centerIndex + 1) % totalNumbers) + 1;

    // Calcule a posição de rolagem ideal para centralizar o número
    final idealOffset = centerIndex * 60.0;

    setState(() {
      if (newNumber != _currentNumber) {
        _currentNumber = newNumber;
      }

      if (stopScroll && userScrolling) {
        userScrolling = false;
        _scrollController.jumpTo(idealOffset);
      }
    });
  }

  void _centralizeSelectedNumber(double idealOffset) {
    userScrolling = false;
    print('Role até a posição ideal');
    _scrollController.animateTo(
      idealOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  bool userScrolling = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            _updateCurrentNumber(false);
            userScrolling = true;
          }
          if (notification is ScrollEndNotification) {
            _updateCurrentNumber(true);
          }
          return false;
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 60,
              width: 70,
              decoration: BoxDecoration (
                color: AppTheme.customColors['white-24'],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Container(
              height: 300,
              width: 70,
              // color: Colors.blue,
              child: ListView.builder(
                controller: _scrollController,
                itemExtent: 60, // Defina a altura do item
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final number = (index % totalNumbers) + 1;
                  return Container(
                    height: 60, // Defina a altura de cada item
                    alignment: Alignment.center,
                    child: GestureDetector (
                      onTap: () {
                        print('Index clicado: $index');
                        // Centralize o número clicado
                        _centralizeSelectedNumber((index - 1) * 60.0);
                      },
                      child: Text(
                        '$number',
                        style: number == _currentNumber ? AppTheme.customTextStyles['regular-34-highlight']! : AppTheme.customTextStyles['regular-24']!,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
