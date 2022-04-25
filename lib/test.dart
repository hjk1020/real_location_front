import 'package:flutter/material.dart';

class SliverExample extends StatelessWidget {
  final double maxHieght = 150.0; // 앱바 및 앱바의 확장 영역을 포함한 높이
  final double titleLeftPadding = 16.0; // 제목 Text 앞에 추가할 패딩 크기
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, ext) => [
          SliverAppBar(
            automaticallyImplyLeading: true, // 뒤로 가기 버튼 자동 생성
            expandedHeight: maxHieght,
            floating: false,
            pinned: true, // 스크롤 시 사라지지 않도록
            flexibleSpace: LayoutBuilder(builder: (context, constraints) {
              final double minHeight = kToolbarHeight;
              final double maxDiff = maxHieght - kToolbarHeight;
              final double currentDiff = constraints.maxHeight - minHeight;
              final double leftPadding =
                  (titleLeftPadding - 72.0) * ((currentDiff / maxDiff));
              return Stack(
                overflow: Overflow.visible, // 없애도 되는 부분
                children: [
                  Positioned(
                    bottom: 0.0, // 아래 패딩 삭제
                    left: leftPadding, // 왼쪽 패딩 삭제
                    width: 300.0, // 제목 짤리지 않을 만큼의 너비
                    height: kToolbarHeight, // 텍스트 전부 보이도록
                    child: FlexibleSpaceBar(
                      title: Text(
                        '제목 부분',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
        body: Center(
          child: Text('sliver appbar 활용'),
        ),
      ),
    );
  }
}
