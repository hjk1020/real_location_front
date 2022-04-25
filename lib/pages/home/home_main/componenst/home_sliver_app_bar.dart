import 'package:flutter/material.dart';
import 'package:real_app_2/theme/theme.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      //  backgroundColor: Colors.white,
      // elevation: 20.0,
      //shadowColor: AppColor.primary,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.add_reaction,
            size: 30.0,
          ),
          Row(
            children: [
              // Icon(
              //   Icons.search_rounded,
              //   size: 30.0,
              // ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_today,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.portrait),
              )
            ],
          )
        ],
      ),
    );
  }
}
