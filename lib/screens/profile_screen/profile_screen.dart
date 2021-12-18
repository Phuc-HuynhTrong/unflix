import 'package:flutter/material.dart';
import 'package:unflix/screens/home_page/home_page_sreen.dart';
import 'package:unflix/screens/profile_screen/account_screen.dart';
import 'package:unflix/screens/profile_screen/downloaded_screen.dart';
import 'package:unflix/screens/profile_screen/edit_profile_screen.dart';
import 'package:unflix/screens/profile_screen/favourite_list_screen.dart';
import 'package:unflix/screens/profile_screen/help_screen.dart';
import 'package:unflix/screens/profile_screen/setting_screen.dart';
import 'package:unflix/style/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            CustomButton(
              leading: Icons.check,
              title: "Danh sách",
              navigateToScreen: FavouriteListScreen(),
            ),
            CustomButton(
              leading: Icons.file_download_outlined,
              title: "Tệp đã tải xuống",
              navigateToScreen: DownloadedScreen(),
            ),
            CustomButton(
              leading: Icons.settings_sharp,
              title: "Cài đặt ứng dụng",
              navigateToScreen: SettingScreen(),
            ),
            CustomButton(
                navigateToScreen: AccountScreen(),
                leading: Icons.person_outline_rounded,
                title: "Tài khoản"),
            CustomButton(
                navigateToScreen: HelpScreen(),
                leading: Icons.help_outline_outlined,
                title: "Trợ giúp"),
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

  Widget SignOutButton() {
    return Center(
      child: GestureDetector(
        onTap: () {},
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
            style: kLTTile,
          ),
        ),
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      height: 140.0,
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
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => EditProfileScreen()));
            },
            child: Container(
              width: 165.0,
              child: Row(
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
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData leading;
  final String title;
  final Widget navigateToScreen;
  const CustomButton({
    Key? key,
    required this.leading,
    required this.title,
    required this.navigateToScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => navigateToScreen)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.0),
        height: 45.0,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        color: Color.fromARGB(255, 18, 18, 18),
        child: Row(
          children: [
            Icon(
              leading,
              color: Color.fromARGB(255, 122, 122, 122),
              size: 24.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Text(
                title,
                style: kLTTile,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 3.0),
              child: Icon(
                Icons.arrow_right_rounded,
                color: Color.fromARGB(255, 122, 122, 122),
                size: 30.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
