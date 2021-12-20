import 'package:flutter/material.dart';
import 'package:unflix/screens/auth_screens/login_screen.dart';
import 'package:unflix/screens/home_page/home_page_sreen.dart';

import '../../home.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}



bool isShowPassword = false;
class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 150, left: 18, right: 18),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text('Hello, Nice to meet you!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
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

            Container(
              child: TextFormField(
                cursorColor: Colors.white,
                obscureText: !isShowPassword,
                style: TextStyle(color: Colors.white, fontSize: 16, ),
                decoration: InputDecoration(
                    hintText: "Mật khẩu",

                    hintStyle: TextStyle(color: Colors.white54, fontSize: 16, ),
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(12, 18, 12, 0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Color(0xff2B2B2B),
                    prefixIcon: Icon(Icons.vpn_key, size: 25, color: Colors.white,),
                    suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        child: Icon( isShowPassword? Icons.remove_red_eye: Icons.visibility_off_rounded, size: 25, color: Colors.grey,))
                ),
              ),
            ),

            SizedBox(height: 12,),

            Container(
              child: TextFormField(
              cursorColor: Colors.white,
              obscureText: !isShowPassword,
              style: TextStyle(color: Colors.white, fontSize: 16, ),
              decoration: InputDecoration(
                  hintText: "Mật khẩu",

                  hintStyle: TextStyle(color: Colors.white54, fontSize: 16, ),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(12, 18, 12, 0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Color(0xff2B2B2B),
                  prefixIcon: Icon(Icons.vpn_key, size: 25, color: Colors.white,),
                  suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      child: Icon( isShowPassword? Icons.remove_red_eye: Icons.visibility_off_rounded, size: 25, color: Colors.grey,))
              ),
            ),
            ),
            SizedBox(height: 12,),


            GestureDetector(
              onTap: () async {
                await ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //width: MediaQuery.of(context).size.width ,
                  backgroundColor: Color(0xffF6C700),
                  content: Text(
                    "Đăng ký thành công",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  duration: Duration(milliseconds: 1000),
                ));
                Future.delayed(const Duration(milliseconds: 800), () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,

                ),
                padding: EdgeInsets.symmetric(vertical: 12),
                width: MediaQuery.of(context).size.width-36,
                child: Text('Đăng ký', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,

              child: Text('UNFLIX', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Color(0xffF6C700)),),
            ),

            Container(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 0),
              child: Text('SIGN UP', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold,height: 0.7, color: Colors.white), ),
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
