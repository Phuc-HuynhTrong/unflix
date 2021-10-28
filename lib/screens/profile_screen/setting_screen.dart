import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unflix/screens/profile_screen/delete_all_download_screen.dart';
import 'package:unflix/screens/profile_screen/use_mobile_data_screen.dart';
import 'package:unflix/screens/profile_screen/video_quality_screen.dart';
import 'package:unflix/style/text_style.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          textTheme: TextTheme(
              headline6: TextInApp().headline6(Colors.white, context)),
          title: Text('Cài đặt ứng dụng'),
          iconTheme: IconThemeData(color: Colors.white),
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
          child: ListView(
            children: [
              Text(
                'Phát lại video',
                style: TextInApp().headline6(Colors.white, context),
              ),
              CustomListTileNavigate(
                leading: Icons.signal_cellular_alt_rounded,
                title: "Sử dụng dữ liệu di động",
                subtitle: 'Tự động',
                navigateToScreen: UseMobileDataScreen(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Tệp tải xuống',
                style: TextInApp().headline6(Colors.white, context),
              ),
              CustomListTileButton(
                leading: Icons.signal_wifi_4_bar_rounded,
                title: "Chỉ dùng wifi",
              ),
              CustomListTileButton(
                leading: Icons.download_for_offline_outlined,
                title: "Tải xuống thông minh",
                subtitle:
                    'Các tệp đã xem xong sẽ bị xóa và thay thế bằng các tập tiếp theo, chỉ sử dụng wifi',
              ),
              CustomListTileNavigate(
                leading: Icons.settings,
                title: 'Chất lượng video',
                subtitle: 'Tiêu chuẩn',
                navigateToScreen: VideoQualityScreen(),
              ),
              CustomListTileNavigate(
                leading: Icons.delete_outline,
                title: 'Xóa tất cả các tệp đã tải xuống',
                navigateToScreen: DeleteAllDownloadScreen(),
              ),
            ],
          ),
        ));
  }
}

class CustomListTileNavigate extends StatelessWidget {
  final IconData leading;
  final String title;
  final Widget navigateToScreen;
  final String subtitle;
  const CustomListTileNavigate({
    Key? key,
    required this.leading,
    required this.title,
    this.subtitle = '',
    required this.navigateToScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => navigateToScreen));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.0),
        height: 80.0,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        color: Color.fromARGB(255, 18, 18, 18),
        child: Row(
          children: [
            Icon(
              leading,
              color: Color.fromARGB(255, 122, 122, 122),
              size: 30.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: kLTTile,
                  ),
                  if (subtitle != '')
                    Flexible(
                      child: Text(
                        subtitle,
                        style: kLTSubtitle,
                      ),
                    ),
                ],
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
      ),
    );
  }
}

class CustomListTileButton extends StatefulWidget {
  final IconData leading;
  final String title;
  final String subtitle;

  const CustomListTileButton({
    Key? key,
    required this.leading,
    required this.title,
    this.subtitle = '',
  }) : super(key: key);

  @override
  _CustomListTileButtonState createState() => _CustomListTileButtonState();
}

class _CustomListTileButtonState extends State<CustomListTileButton> {
  bool _isEnalbeButton = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isEnalbeButton = !_isEnalbeButton;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.0),
        height: 80.0,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        color: Color.fromARGB(255, 18, 18, 18),
        child: Row(
          children: [
            Icon(
              widget.leading,
              color: Color.fromARGB(255, 122, 122, 122),
              size: 30.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: kLTTile,
                  ),
                  if (widget.subtitle != '')
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        widget.subtitle,
                        style: kLTSubtitle,
                      ),
                    ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 5.0),
                child: CupertinoSwitch(
                    value: _isEnalbeButton,
                    onChanged: (bool value) {
                      setState(() {
                        _isEnalbeButton = value;
                      });
                    }))
          ],
        ),
      ),
    );
  }
}
