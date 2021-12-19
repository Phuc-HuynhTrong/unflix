import 'package:flutter/material.dart';
import 'package:unflix/core/models/SuperIcon.dart';
import 'package:unflix/screens/profile_screen/favourite_list_screen.dart';
import 'package:unflix/style/text_style.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
        textTheme:
            TextTheme(headline6: TextInApp().navigation(Colors.white, context)),
        title: const Text(
          "Tài khoản",
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: SuperIcon(
                iconPath: 'assets/icons/account.svg',
                size: 165,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Kiêm Lơm",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              child: Text(
                "tkl84@gmail.com",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Đổi mật khẩu",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Container(
              child: Text(
                "THỐNG KÊ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteListScreen()));
              },
                child: InfomationCard(
                    title: "Phim đã xem",
                    quantity: "52",
                    iconPath: "assets/icons/movie.svg")),
            SizedBox(
              height: 12,
            ),
            InfomationCard(
                title: "Tổng thời gian xem (phút):",
                quantity: "5532",
                iconPath: "assets/icons/time.svg"),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteListScreen()));
              },
              child: InfomationCard(
                  title: "Phim đã thích",
                  quantity: "30",
                  iconPath: "assets/icons/like.svg"),
            ),
          ],
        ),
      ),
    );
  }
}

class InfomationCard extends StatefulWidget {
  const InfomationCard(
      {Key? key,
      required this.title,
      required this.quantity,
      required this.iconPath})
      : super(key: key);
  final String title;
  final String quantity;
  final String iconPath;

  @override
  _InfomationCardState createState() => _InfomationCardState();
}

class _InfomationCardState extends State<InfomationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Color(0xff222222)),
      child: Row(
        children: [
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          Expanded(child: Container()),
          Text(
            widget.quantity,
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            child: SuperIcon(
              iconPath: widget.iconPath,
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
