import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchCustom extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const SwitchCustom({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  _SwitchCustomState createState() => _SwitchCustomState();
}

class _SwitchCustomState extends State<SwitchCustom> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width),
      constraints: BoxConstraints(
        minHeight: 48.0.h,
      ),
      // color: Colors.yellow,
      child: Row(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - 103.w),
            constraints: BoxConstraints(
              minHeight: 48.0.h,
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            // color: Colors.blue,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.text,
                  style: AppTheme.customTextStyles['medium-20']),
            ),
          ),
          Container(
            width: 55.w,
            height: 30.h,
            // color: Colors.green,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  backgroundColor: MaterialStatePropertyAll(
                    isSwitched
                        ? AppTheme.customColors['activated-switch']
                        : AppTheme.customColors['deactivated-switch'],
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isSwitched = !isSwitched;
                    print('isSwitched: $isSwitched');
                    widget.onPressed();
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: 100.0.w,
                  alignment:
                      isSwitched ? Alignment.centerRight : Alignment.centerLeft,
                  padding: EdgeInsets.zero,
                  child: Container(
                    height: 26.h,
                    width: 26.w,
                    margin: EdgeInsets.all(2.sp),
                    decoration: BoxDecoration(
                      color: AppTheme.customColors['white-100'],
                      borderRadius: BorderRadius.circular(26.sp),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.customColors['black-28']!,
                          offset: Offset(0.w, 5.h),
                          blurRadius: 10.sp,
                        ),
                      ],
                    ),
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
