import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberList extends StatefulWidget {
  final int numberQuantity;
  final bool isHorizontal;
  final List<String> elements;
  final Function(int)? onSelectionChanged;
  final int displayedElements;
  final double cardsHeight;
  final double cardsWidth;
  final TextStyle selectedText;
  final TextStyle unselectedText;

  NumberList({
    Key? key,
    required this.numberQuantity,
    required this.isHorizontal,
    required this.elements,
    this.onSelectionChanged,
    required this.displayedElements,
    this.cardsHeight = 60,
    this.cardsWidth = 60,
    required this.selectedText,
    required this.unselectedText,
  }) : super(key: key);

  @override
  _NumberListState createState() => _NumberListState();
}

class _NumberListState extends State<NumberList> {
  late ScrollController _scrollController;
  late int _currentNumber = 1;
  late int totalNumbers;
  late int displayedElements;

  double selectionSize = 0;
  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    _currentNumber = 0;
    selectionSize =
        (widget.isHorizontal ? widget.cardsWidth.w : widget.cardsHeight.h);
    totalNumbers = widget.elements.length;
    displayedElements = widget.displayedElements;
    double initialIndex =
        totalNumbers * 1000 + (displayedElements % 2 == 0 ? 1 : 0);
    _scrollController = ScrollController(
      initialScrollOffset: (initialIndex * selectionSize) -
          ((displayedElements / 2).floor() * selectionSize),
    );
  }

  void _updateCurrentNumber(bool stopScroll) {
    if (isAnimating) return;

    final initialIndex = (((_scrollController.offset) / selectionSize).round());
    final jumpOffset =
        (displayedElements / 2).floor() - (displayedElements % 2 != 0 ? 0 : 1);
    final centerIndex = initialIndex + jumpOffset;

    final newNumber = ((centerIndex % totalNumbers));

    // Calcule a posição de rolagem ideal para centralizar o número
    final idealOffset = (initialIndex * selectionSize);

    setState(() {
      if (newNumber != _currentNumber) {
        _currentNumber = newNumber;
      }

      if (stopScroll) {
        isAnimating = true;

        _scrollController
            .animateTo(
              idealOffset,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            )
            .then((value) => isAnimating = false);
      }

      if (widget.onSelectionChanged != null) {
        widget.onSelectionChanged!(_currentNumber);
      }
    });
  }

  void _centralizeSelectedNumber(double idealOffset) {
    setState(() {
      _scrollController
          .animateTo(
            displayedElements % 2 == 0
                ? idealOffset + selectionSize
                : idealOffset,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          )
          .then((value) => isAnimating = false);
    });
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
            Future.delayed(Duration(milliseconds: 1))
                .then((value) => _updateCurrentNumber(true));
          }
          return false;
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                  right: (widget.isHorizontal && displayedElements % 2 == 0
                      ? widget.cardsWidth.w
                      : 0),
                  bottom: (!widget.isHorizontal && displayedElements % 2 == 0
                      ? widget.cardsHeight.h
                      : 0)),
              width: widget.cardsWidth.w,
              height: widget.cardsHeight.h,
              decoration: BoxDecoration(
                color: AppTheme.customColors['white-24'],
                borderRadius: BorderRadius.circular(8.sp),
              ),
            ),
            Container(
              width: widget.isHorizontal
                  ? (displayedElements * widget.cardsWidth.w)
                  : widget.cardsWidth,
              height: widget.isHorizontal
                  ? widget.cardsHeight.h
                  : (displayedElements * widget.cardsHeight.h),
              // color: Colors.green,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                controller: _scrollController,
                itemExtent: widget.isHorizontal
                    ? widget.cardsWidth.w
                    : widget.cardsHeight.h, // Defina a altura do item
                scrollDirection:
                    widget.isHorizontal ? Axis.horizontal : Axis.vertical,
                itemBuilder: (context, index) {
                  final number = (index % totalNumbers);
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      _centralizeSelectedNumber(
                          (index - ((displayedElements / 2).floor())) *
                              (selectionSize));
                    },
                    child: Container(
                      // margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      // color: Colors.pink,
                      alignment: Alignment.center,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${widget.elements[number]}',
                          style: number == _currentNumber
                              ? widget.selectedText
                              : widget.unselectedText,
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
