import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';

class NumberList extends StatefulWidget {
  final int numberQuantity;
  final bool isHorizontal;
  final List<String>? dados;
  final Function(int)? onSelectionChanged;
  final int? initialNumber;

  NumberList(
      {Key? key,
      required this.numberQuantity,
      required this.isHorizontal,
      this.dados,
      this.onSelectionChanged,
      this.initialNumber})
      : super(key: key);

  @override
  _NumberListState createState() => _NumberListState();
}

class _NumberListState extends State<NumberList> {
  late ScrollController _scrollController;
  late int _currentNumber = 1;
  late String _currentContent;
  late double _currentIndex;
  late int totalNumbers;

  @override
  void initState() {
    super.initState();
    _currentNumber = 1;
    _currentIndex = 1000;
    // _currentContent = widget.dados[0];
    totalNumbers = widget.numberQuantity;
    _scrollController = ScrollController(
      initialScrollOffset: (1000 * 60.0) -
          (totalNumbers > 5
              ? (widget.isHorizontal ? 120 : 60)
              : (widget.isHorizontal ? 60 : 0)),
    );
  }

  void _updateCurrentNumber(bool stopScroll) {
    final centerIndex = (_scrollController.offset / 60).round();

    final newNumber = ((centerIndex +
                (totalNumbers > 5
                    ? (widget.isHorizontal ? 2 : 1)
                    : (widget.isHorizontal ? 1 : 0))) %
            totalNumbers) +
        1;

    // Calcule a posição de rolagem ideal para centralizar o número
    final idealOffset = centerIndex * 60.0;

    setState(() {
      if (newNumber != _currentNumber) {
        _currentNumber = newNumber;
        _currentIndex = idealOffset;
      }

      if (stopScroll && userScrolling) {
        userScrolling = false;
        _scrollController.jumpTo(idealOffset);
      }

      if (widget.onSelectionChanged != null) {
        widget.onSelectionChanged!(_currentNumber);
      }
    });
  }

  void _centralizeSelectedNumber(double idealOffset) {
    userScrolling = false;
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
              height: widget.isHorizontal ? 70 : 60,
              width: widget.isHorizontal ? 60 : 70,
              decoration: BoxDecoration(
                color: AppTheme.customColors['white-24'],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Container(
              height: widget.isHorizontal ? 70 : (totalNumbers < 5 ? 180 : 300),
              width: widget.isHorizontal ? (totalNumbers < 5 ? 180 : 300) : 70,
              // color: Colors.blue,
              child: ListView.builder(
                controller: _scrollController,
                itemExtent: 60, // Defina a altura do item
                scrollDirection:
                    widget.isHorizontal ? Axis.horizontal : Axis.vertical,
                itemBuilder: (context, index) {
                  final number = (index % totalNumbers) + 1;
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      print('index clicado: $index');
                      // Centralize o número clicado
                      _centralizeSelectedNumber((index -
                              (totalNumbers > 5
                                  ? (widget.isHorizontal ? 2 : 1)
                                  : (widget.isHorizontal ? 1 : 0))) *
                          60.0);
                      print('Numero atual: $_currentNumber');
                      print('Numero selecionado: $number');
                    },
                    child: Container(
                      height: 60, // Defina a altura de cada item
                      // color: Colors.pink,
                      alignment: Alignment.center,
                      child: Text(
                        '$number',
                        style: number == _currentNumber
                            ? AppTheme.customTextStyles['regular-24-highlight']!
                            : AppTheme.customTextStyles['medium-14']!,
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
