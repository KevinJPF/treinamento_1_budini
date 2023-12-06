import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  final String tituloHeader;
  final bool hasLeftIcon;
  final IconData? leftIcon;
  final bool hasRightIcon;
  final IconData? rightIcon;

  const Header(
      {super.key,
      required this.tituloHeader,
      required this.hasLeftIcon,
      this.leftIcon,
      required this.hasRightIcon,
      this.rightIcon});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: statusBarHeight),
          width: MediaQuery.of(context).size.width,
          height: 56.h,
          // color: Colors.white,
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 48.h,
              width: 48.w,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 4.h, left: 4.w),
              // color: Colors.orange,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.transparent,
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(Size(48.w, 48.h)),
                ),
                child: Icon(
                  leftIcon,
                  color: AppTheme.customColors['white-100'],
                  size: 24.sp,
                ),
              ),
            ),
            Container(
              height: 56.h,
              width: null,
              margin: EdgeInsets.only(left: 20.w),
              alignment: Alignment.center,
              // color: Colors.orange,
              child: Text(
                tituloHeader,
                style: AppTheme.customTextStyles['medium-20'],
              ),
            ),
            Spacer(),
            Container(
              height: 48.h,
              width: hasRightIcon ? 48.w : 0,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 4.h),
              // color: Colors.orange,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.transparent,
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(Size(48.w, 48.h)),
                ),
                child: Icon(
                  rightIcon,
                  color: AppTheme.customColors['white-100'],
                  size: 24.sp,
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
