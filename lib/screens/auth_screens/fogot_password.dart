import 'package:flutter/material.dart';
import 'package:unflix/screens/auth_screens/login_screen.dart';


class FogotPasswordScreen extends StatefulWidget {
  const FogotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<FogotPasswordScreen> createState() => _FogotPasswordScreenState();
}



bool isShowPassword = false;
class _FogotPasswordScreenState extends State<FogotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 150, left: 18, right: 18),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text('Quên mật khẩu sao?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('Điền mail để nhận link đặt lại mật khẩu nào.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
            ),

            SizedBox(height: 12,),
            Container(
              child: TextFormField(
                cursorColor: Colors.white,

                style: TextStyle(color: Colors.white, fontSize: 16, ),
                decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.white54, fontSize: 16, ),
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(12, 18, 12, 5),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Color(0xff2B2B2B),
                    prefixIcon: Icon(Icons.person, size: 25, color: Colors.white,)
                ),
              ),
            ),
            SizedBox(height: 12,),



            GestureDetector(
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //width: MediaQuery.of(context).size.width ,
                  backgroundColor: Color(0xffF6C700),
                  content: Text(
                    "Đã gửi mail, xin kiểm tra mail của bạn",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  duration: Duration(milliseconds: 2000),
                ));
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,

                ),
                padding: EdgeInsets.symmetric(vertical: 12),
                width: MediaQuery.of(context).size.width-36,
                child: Text('Gửi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,

              child: Text('UNFLIX', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Color(0xffF6C700)),),
            ),

            Container(
              alignment: Alignment.centerLeft,

              child: Text('đặt lại', style: TextStyle(fontSize: 30,height: 0.5, fontWeight: FontWeight.bold, color: Color(0xffffffff)),),
            ),

            Container(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 0),
              child: Text('Mật khẩu', style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold,height: 1.1, color: Colors.white), ),
            ),

            Expanded(child: Container( child: Text(""),),),

            Container(
              margin: EdgeInsets.only(bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bạn đã có tài khoản?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                  SizedBox(width: 8,),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: Text('Đăng nhập', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xffF6C700)),)),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
