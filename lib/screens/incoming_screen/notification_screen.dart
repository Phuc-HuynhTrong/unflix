import 'package:flutter/material.dart';
import 'package:unflix/core/data/notification_list.dart';
import 'package:unflix/screens/film_information/film_information_screen.dart';
import 'package:unflix/style/text_style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: AppBarTheme(backgroundColor: Colors.black)),
        child: Scaffold(
          appBar: AppBar(
            textTheme: TextTheme(
                headline6: TextInApp().headline6(Colors.white, context)),
            title: Text('Thông báo'),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.cast,
                ),
              ),
            ],
          ),
          body: Container(
              padding: EdgeInsets.all(5.0),
              child: ListView.builder(
                  itemCount: notificationList.length,
                  itemBuilder: (_, index) => CustomCard(
                      imageLink: notificationList[index].imageLink,
                      title: notificationList[index].title,
                      subtitle: notificationList[index].subtitle,
                      dateTime: notificationList[index].dateTime))),
        ));
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.imageLink,
    required this.title,
    required this.subtitle,
    required this.dateTime,
  }) : super(key: key);

  final String imageLink;
  final String title;
  final String subtitle;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FilmInformationScreen()));
        },
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              height: 100,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(fit: BoxFit.fill, image: AssetImage(imageLink)),
              ),
            ),
            Expanded(
              child: Container(
                height: 115,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                    ),
                    Text(
                      subtitle,
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
                    ),
                    Text(
                      dateTime,
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
