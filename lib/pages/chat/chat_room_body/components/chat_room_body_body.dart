import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/theme/theme.dart';

class ChatRoomBodyBody extends StatelessWidget {
  const ChatRoomBodyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  //margin: Ed,
                  padding: EdgeInsets.only(
                      top: 5.0, bottom: 5.0, right: 10.0, left: 10.0),
                  //height: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: AppColor.dark_grey,
                  ),
                  child: const Text(
                    '2월 11일',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.0, color: AppColor.white),
                  ),
                ),
              ),
              YouMessageForm(
                image: 'assets/images/dog.jpeg',
                name: '미나',
                text: '안녕하세요.',
                dateText: '오후 6:25',
              ),
              MeMessageForm(
                text: '안녕하세요',
                dateText: '오후 6:26',
              ),
              YouMessageForm(
                image: 'assets/images/dog.jpeg',
                name: '미나',
                text: '우리 언제쯤 모일까요?',
                dateText: '오후 6:27',
              ),
              MeMessageForm(
                text: '내일 6시쯤 어떤가요?',
                dateText: '오후 6:27',
              ),
              // YouMessageForm(
              //   image: 'assets/images/dog.jpeg',
              //   name: '미나',
              //   text: '네 좋습니다. 😄😄😄',
              //   dateText: '오후 6:28',
              // ),
              // YouMessageForm(
              //   image: 'assets/images/dog.jpeg',
              //   name: '미나',
              //   text: '네 좋습니다. 😄😄😄',
              //   dateText: '오후 6:28',
              // ),
              // YouMessageForm(
              //   image: 'assets/images/dog.jpeg',
              //   name: '미나',
              //   text: '네 좋습니다. 😄😄😄',
              //   dateText: '오후 6:28',
              // ),
              // YouMessageForm(
              //   image: 'assets/images/dog.jpeg',
              //   name: '미나',
              //   text: '네 좋습니다. 😄😄😄',
              //   dateText: '오후 6:28',
              // ),
              YouMessageForm(
                image: 'assets/images/dog.jpeg',
                name: '미나',
                text: '네 좋습니다. 😄😄😄',
                dateText: '오후 6:28',
              ),
              YouMessageForm(
                image: 'assets/images/dog.jpeg',
                name: '미나',
                text: '오늘 만남 너무 좋았습니다. ~~',
                dateText: '오후 6:26',
              ),
              MeMessageForm(
                text: '다들 수고하셨습니다.',
                dateText: '오후 6:27',
              ),
              YouMessageForm(
                image: 'assets/images/dog.jpeg',
                name: '미나',
                text: '다들 수고하셧습니다.~~ ',
                dateText: '오후 6:28',
              ),
              YouMessageForm(
                image: 'assets/images/dog2.jpeg',
                name: '사나',
                text: '다들 좋으신 분들이라 즐거운 모임이었습니다.',
                dateText: '오후 6:30',
              ),
              YouMessageForm(
                image: 'assets/images/dog3.jpeg',
                name: '윈터',
                text: '저도 즐거웠어요 ~~ ㅎㅎ',
                dateText: '오후 6:31',
              ),
              MeMessageForm(
                text: '다들 수고하셨습니다.',
                dateText: '오후 6:32',
              ),
              MeMessageForm2(
                child: Column(children: [
                  Text(
                    '방이 만료 되었습니다. 비밀방 초대하기 기능이 활성화 되었으니 맘에 드는 분을 초대해 보세요.',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: 17,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      '초대하기',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ]),
                dateText: '오후 6:33',
              ),
              Container(
                height: Get.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MeMessageForm2 extends StatelessWidget {
  final child;
  final dateText;

  const MeMessageForm2({
    Key? key,
    this.child,
    this.dateText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              dateText,
              style: TextStyle(color: AppColor.light_grey, fontSize: 12.0),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: Get.width * 0.6),
            child: Container(
                padding: const EdgeInsets.all(13.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.yellow,
                ),
                child: child

                //  Text(
                //   text,
                //   style: TextStyle(color: AppColor.white, fontSize: 20.0),
                // ),
                ),
          )
        ],
      ),
    );
  }
}

class MeMessageForm extends StatelessWidget {
  final text;
  final dateText;

  const MeMessageForm({
    Key? key,
    this.text,
    this.dateText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              dateText,
              style: TextStyle(color: AppColor.light_grey, fontSize: 12.0),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: Get.width * 0.6),
            child: Container(
              padding: const EdgeInsets.all(13.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: AppColor.dark_grey,
              ),
              child: Text(
                text,
                style: TextStyle(color: AppColor.white, fontSize: 17.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class YouMessageForm extends StatelessWidget {
  final text;
  final dateText;
  final image;
  final name;

  const YouMessageForm({
    Key? key,
    this.text,
    this.dateText,
    this.image,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset(
                image,
                // 'assets/images/dog.jpeg',
                width: 40,
                height: 40,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: Get.width * 0.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      // '홍솔아',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Container(
                      padding: const EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: AppColor.extra_light_grey,
                      ),
                      child: Text(text,
                          softWrap: true,
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 17.0)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  dateText,
                  style: TextStyle(fontSize: 12.0, color: AppColor.light_grey),
                  // textAlign: TextAlign.end,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
