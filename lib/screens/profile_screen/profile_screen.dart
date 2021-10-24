import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.cast,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: [
            UserAvatar(),
            CustomButton(leading: Icons.check, title: "Danh sách"),
            CustomButton(
                leading: Icons.file_download_outlined,
                title: "Tệp đã tải xuống"),
            CustomButton(
                leading: Icons.settings_sharp, title: "Cài đặt ứng dụng"),
            CustomButton(
                leading: Icons.person_outline_rounded, title: "Tài khoản"),
            CustomButton(
                leading: Icons.help_outline_outlined, title: "Trợ giúp"),
            SizedBox(
              height: 10.0,
            ),
            SignOutButton(),
            Text(
              'Phiên bản 1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 29, 29, 29),
                fontSize: 15.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget UserAvatar() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        height: 130.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.person_outline_rounded,
              size: 55.0,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 8.0),
              child: Text(
                'Kim Lom',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                  size: 18.0,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text('Quản lý hồ sơ',
                    style: TextStyle(
                      letterSpacing: 1.2,
                      color: Color.fromARGB(255, 146, 146, 146),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget SignOutButton() {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 18, 18, 18),
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: Alignment.center,
        height: 42.0,
        width: 157.0,
        child: Text(
          'Đăng xuất',
          style: TextStyle(
            color: Color.fromARGB(255, 122, 122, 122),
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData leading;
  final String title;
  const CustomButton({
    Key? key,
    required this.leading,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.0),
      height: 50.0,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      color: Color.fromARGB(255, 18, 18, 18),
      child: Row(
        children: [
          Icon(
            leading,
            color: Color.fromARGB(255, 122, 122, 122),
            size: 25.0,
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Color.fromARGB(255, 122, 122, 122),
                fontSize: 19.0,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 5.0),
            child: Icon(
              Icons.arrow_right_rounded,
              color: Color.fromARGB(255, 122, 122, 122),
              size: 30.0,
            ),
          )
        ],
      ),
    );
  }
}
