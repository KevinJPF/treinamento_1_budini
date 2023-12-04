import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberList extends StatefulWidget {
  final int numberQuantity;
  final bool isHorizontal;
  final List<String>? dados;
  final Function(int)? onSelectionChanged;
  final int? initialNumber;
  final int displayedNumbers;

  NumberList(
      {Key? key,
      required this.numberQuantity,
      required this.isHorizontal,
      this.dados,
      this.onSelectionChanged,
      this.initialNumber,
      required this.displayedNumbers})
      : super(key: key);

  @override
  _NumberListState createState() => _NumberListState();
}

class _NumberListState extends State<NumberList> {
  late ScrollController _scrollController;
  late int _currentNumber = 1;
  late String _currentContent;
  late int totalNumbers;
  late int displayedNumbers;

  double selectionSize = 0;
  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    _currentNumber = 1;
    selectionSize = (widget.isHorizontal ? 60.0.w : 60.0.h);
    // _currentContent = widget.dados[0];
    totalNumbers = widget.numberQuantity;
    displayedNumbers = widget.displayedNumbers;
    _scrollController = ScrollController(
      initialScrollOffset: (1000 * selectionSize) -
          ((displayedNumbers / 2).floor() * selectionSize),
    );
  }

  void _updateCurrentNumber(bool stopScroll) {
    if (isAnimating) return;

    final initialIndex = (((_scrollController.offset) / selectionSize).round());
    final jumpOffset =
        (displayedNumbers / 2).floor() - (displayedNumbers % 2 != 0 ? 0 : 1);
    final centerIndex = initialIndex + jumpOffset;

    final newNumber = ((centerIndex % totalNumbers) + 1);

    // Calcule a posição de rolagem ideal para centralizar o número
    final idealOffset = (centerIndex - jumpOffset) * selectionSize;

    setState(() {
      if (newNumber != _currentNumber) {
        _currentNumber = newNumber;
      }

      if (stopScroll) {
        print('index scrollado: $centerIndex');
        print('offset scrollado: $idealOffset');
        print(
            "\n offset: $centerIndex - ($displayedNumbers / 2 * ${selectionSize}) \n");
        isAnimating = true;

        // _centralizeSelectedNumber(idealOffset);
        _scrollController.position.jumpTo(idealOffset);

        isAnimating = false;
      }

      if (widget.onSelectionChanged != null) {
        widget.onSelectionChanged!(_currentNumber);
      }
    });
  }

  void _centralizeSelectedNumber(double idealOffset) {
    _scrollController
        .animateTo(
          displayedNumbers % 2 == 0 ? idealOffset + selectionSize : idealOffset,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        )
        .then((value) => isAnimating = false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            _updateCurrentNumber(false);
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
              margin: EdgeInsets.only(
                  right: (widget.isHorizontal && displayedNumbers % 2 == 0
                      ? 60.w
                      : 0),
                  bottom: (!widget.isHorizontal && displayedNumbers % 2 == 0
                      ? 60.h
                      : 0)),
              width: widget.isHorizontal ? 60.w : 70.w,
              height: widget.isHorizontal ? 70.h : 60.h,
              decoration: BoxDecoration(
                color: AppTheme.customColors['white-24'],
                borderRadius: BorderRadius.circular(8.sp),
              ),
            ),
            Container(
              width: widget.isHorizontal ? (displayedNumbers * 60.w) : 70.w,
              height: widget.isHorizontal ? 70.h : (displayedNumbers * 60.h),
              color: Colors.green,
              child: ListView.builder(
                controller: _scrollController,
                itemExtent: widget.isHorizontal
                    ? 60.w
                    : 60.h, // Defina a altura do item
                scrollDirection:
                    widget.isHorizontal ? Axis.horizontal : Axis.vertical,
                itemBuilder: (context, index) {
                  final number = (index % totalNumbers) + 1;
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      print('index clicado: $index');
                      // Centralize o número clicado
                      _centralizeSelectedNumber(
                          (index - ((displayedNumbers / 2).floor())) *
                              (selectionSize));
                      // print("\n offset: $index - ($displayedNumbers / 2 * ${60.0.sp} \n");

                      print('Numero atual: $_currentNumber');
                      print('Numero selecionado: $number');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      color: Colors.pink,
                      alignment: Alignment.center,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '$number',
                          style: number == _currentNumber
                              ? AppTheme
                                  .customTextStyles['regular-24-highlight']!
                              : AppTheme.customTextStyles['medium-14']!,
                        ),
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
