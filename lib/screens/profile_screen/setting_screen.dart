import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unflix/core/models/SuperIcon.dart';
import 'package:unflix/screens/profile_screen/delete_all_download_screen.dart';
import 'package:unflix/screens/profile_screen/use_mobile_data_screen.dart';
import 'package:unflix/screens/profile_screen/video_quality_screen.dart';
import 'package:unflix/style/text_style.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double data = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
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
          textTheme: TextTheme(
              headline6: TextInApp().navigation(Colors.white, context)),
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
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                margin: EdgeInsets.only(left: 12, bottom: 8),
                child: Text(
                  'Phát lại video',
                  style: TextInApp().headline6(Colors.white, context),
                ),
              ),
              CustomListTileNavigate(
                iconPath: "assets/icons/data.svg",
                title: "Sử dụng dữ liệu di động",
                subtitle: 'Tự động',
                navigateToScreen: UseMobileDataScreen(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 12, bottom: 8),
                child: Text(
                  'Tệp tải xuống',
                  style: TextInApp().headline6(Colors.white, context),
                ),
              ),
              CustomListTileButton(
                iconPath: "assets/icons/wifi.svg",
                title: "Chỉ dùng wifi",
              ),
              CustomListTileButton(
                iconPath: "assets/icons/screen-share.svg",
                title: "Tải xuống thông minh",
                subtitle:
                    'Các tệp đã xem xong sẽ bị xóa và thay thế bằng các tập tiếp theo, chỉ sử dụng wifi',
              ),
              CustomListTileNavigate(
                iconPath: "assets/icons/filter.svg",
                title: 'Chất lượng video',
                subtitle: 'Tiêu chuẩn',
                navigateToScreen: VideoQualityScreen(),
              ),

              DeleteAllButton(data: data)

            ],
          ),
        ));
  }
}

class CustomListTileNavigate extends StatelessWidget {
  final String iconPath;
  final String title;
  final Widget navigateToScreen;
  final String subtitle;
  const CustomListTileNavigate({
    Key? key,
    required this.iconPath,
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
            SuperIcon(iconPath: iconPath, size: 30),
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
              margin: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0xff9C9C9C),
                size: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTileButton extends StatefulWidget {
  final String iconPath;
  final String title;
  final String subtitle;

  const CustomListTileButton({
    Key? key,
    required this.iconPath,
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
            SuperIcon(iconPath: widget.iconPath, size: 30),
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
              height: 40,
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


class DeleteAllButton extends StatefulWidget {
  double data;
   DeleteAllButton({Key? key, required this.data}) : super(key: key);

  @override
  State<DeleteAllButton> createState() => _DeleteAllButtonState();
}

class _DeleteAllButtonState extends State<DeleteAllButton> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(vertical: 1.0),
      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
      color: Color.fromARGB(255, 18, 18, 18),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                widget.data = 0;
                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //width: MediaQuery.of(context).size.width ,
                  backgroundColor: Color(0xffF6C700),
                  content: Text(
                    "Đã xóa các tệp tải xuống",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ));
              });
            },
            child: Row(
              children: [
                SuperIcon(iconPath: "assets/icons/trash.svg", size: 30),
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
                        "Xóa các tệp đã tải xuống",
                        style: kLTTile,
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 18),
            alignment: Alignment.centerLeft,
            child: Text("IPhone 14 porn Max", style: TextStyle(fontSize: 19, fontFamily: "Noto Sans", fontWeight: FontWeight.w500, color: Color(0xffdcdcdc)),),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 9, vertical: 9),
            child: Row(
              children: [
                Container(
                  width: widget.data,
                  color: Color(0xff4D97EF),
                  height: 9,
                ),
                Container(
                  width: 150,
                  color: Color(0xff717171),
                  height: 9,
                ),
                Expanded(
                  child: Container(
                    color: Color(0xffdcdcdc),
                    height: 9,
                  ),
                )
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 9, vertical: 4),
            child: Row(
              children: [

                Container(
                  width: 12, height: 12,
                  color: Color(0xff4D97EF),
                ),
                SizedBox(width: 8,),
                Text("Unflix", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Color(0xff717171)),),


                Spacer(),
                Container(
                  width: 12, height: 12,
                  color: Color(0xff717171),
                ),
                SizedBox(width: 8,),
                Text("Đã sử dụng", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Color(0xff717171)),),

                Spacer(),
                Container(
                  width: 12, height: 12,
                  color: Color(0xffdcdcdc),
                ),
                SizedBox(width: 8,),
                Text("Còn trống", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Color(0xff717171)),),



              ],

            ),
          )
        ],
      ),
    )
    ;
  }
}




