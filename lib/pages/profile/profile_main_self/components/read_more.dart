import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:real_app_2/theme/theme.dart';

class ReadMore extends StatelessWidget {
  final text;

  const ReadMore({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: ReadMoreText(
        text,
        trimLines: 2,
        trimMode: TrimMode.Line,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
        colorClickableText: AppColor.light_grey,
        trimCollapsedText: '...더 보기',
        trimExpandedText: '그만 보기',
        moreStyle: TextStyle(color: AppColor.light_grey),
      ),
    );
  }
}
