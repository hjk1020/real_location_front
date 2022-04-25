import 'package:flutter/material.dart';
import 'package:real_app_2/theme/theme.dart';

class CommunityMainBody extends StatelessWidget {
  const CommunityMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(children: [
        CommunityForm(
          image: 'assets/images/dog.jpeg',
          name: '미나',
          time: '5분전',
          category: '지역질문',
          comment: '0',
          like: '2',
          text: '보건소 줄..... 아이때문에 보건소 가려고 하는데 어느 시간대가 좀 한산할까요 ㅜㅜ',
        ),
        CommunityForm(
          image: 'assets/images/dog2.jpeg',
          name: '사나',
          time: '10분전',
          category: '일상',
          comment: '1',
          like: '1',
          text: '잠 안오시는분 계신가요? 커피를 마셨더니 잠이 안오네요 ㅜㅜ',
        ),
        CommunityForm(
          image: 'assets/images/dog3.jpeg',
          name: '윈터',
          time: '15분전',
          category: '취미',
          comment: '0',
          like: '0',
          text: '자전거 좋아하시는분 없나요? 자전거 같이 타고싶네요',
        ),
        CommunityForm(
          image: 'assets/images/dog3.jpeg',
          name: '윈터',
          time: '15분전',
          category: '취미',
          comment: '0',
          like: '0',
          text: '자전거 좋아하시는분 없나요? 자전거 같이 타고싶네요',
        ),
        CommunityForm(
          image: 'assets/images/dog4.jpeg',
          name: '카리나',
          time: '20분전',
          category: '기타',
          comment: '1',
          like: '1',
          text: '살빼는 방법 아시는분 없나요 ㅜㅜ 살이 잘 안빠지네요',
        ),
      ]),
    ));
  }
}

class CommunityForm extends StatelessWidget {
  final image;
  final name;
  final category;
  final comment;
  final text;
  final like;
  final time;

  const CommunityForm({
    Key? key,
    this.image,
    this.name,
    this.category,
    this.comment,
    this.text,
    this.like,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.asset(
                        image,
                        //'assets/images/dog.jpeg',
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Text(
                        name,
                        // '미나',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      '부개동',
                      style:
                          TextStyle(color: AppColor.dark_grey, fontSize: 17.0),
                    )
                  ],
                ),
                Icon(
                  Icons.more_vert,
                  color: AppColor.light_grey,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                right: 15.0, left: 15.0, top: 10.0, bottom: 10.0),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.light_grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: AppColor.extra_light_grey,
                      ),
                      child: Text(
                        category,
                        // '지역질문',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                  ),
                  Text(
                    text,
                    // '보건소 줄..... 아이때문에 보건소 가려고 하는데 어느 시간대가 좀 한산할까요 ㅜㅜ',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline_rounded,
                              size: 25.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                comment,
                                // '0',
                                style: TextStyle(
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(
                                Icons.favorite_border,
                                size: 25.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                like,
                                // '2',
                                style: TextStyle(
                                  fontSize: 17.0,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          time,
                          // '5분전',
                          style: TextStyle(color: AppColor.dark_grey),
                        )
                      ],
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
