import 'package:flutter/material.dart';

import 'package:unflix/screens/incoming_screen/notification_screen.dart';
import 'package:unflix/style/text_style.dart';

class IncomingScreen extends StatelessWidget {
  const IncomingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Sắp ra mắt',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.0),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
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
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.notifications_none_outlined),
                title: Text('Thông báo'),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => NotificationScreen())),
              ),
              CustomCard(
                title: 'Kẻ đeo bám',
                discription:
                    'Hiện đã kết hôn và có một đứa con nhỏ, Love và Joe cố gắng vun đắp một cuộc sống bình thường ở vùng ngoại ô giàu có Madre Linda. Nhưng mà, thói cũ khó bỏ.',
                tag: 'Đen tối • Kịch tính • Phim giật gân • Chính kịch',
                dateRelease: 'Mùa 3 ra mắt vào 15 tháng 10',
              ),
              CustomCard(
                title: 'Tổng đài truy vết',
                discription:
                    'Bị giáng chức, vị thanh tra biến thành cái đầu buồi',
                tag:
                    'Đen tối • Kịch tính • Phim giật gân • Chính kịch • Như cái đầu buồi',
                dateRelease: 'Ra mắt vào Thứ Sáu',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIconAndLabel extends StatelessWidget {
  const CustomIconAndLabel({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(
          children: [
            Icon(icon),
            Text(label),
          ],
        ));
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.title,
    required this.discription,
    required this.tag,
    required this.dateRelease,
  }) : super(key: key);

  final String title;
  final String discription;
  final String tag;
  final String dateRelease;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            height: 200.0,
            width: double.infinity,
            color: Colors.grey,
            child: Center(
              child: Text('Video ne'),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                          image:
                              AssetImage('assets/images/incoming_image.png')),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        dateRelease,
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
                CustomIconAndLabel(
                  icon: Icons.notifications_none_outlined,
                  label: 'Nhắc tôi',
                ),
                CustomIconAndLabel(
                  icon: Icons.info_outline,
                  label: 'Thông tin',
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              // ,
              title,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              discription,
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16.0),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              tag,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
