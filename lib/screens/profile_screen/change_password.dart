import 'package:flutter/material.dart';
import 'package:unflix/style/text_style.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  String currentlyPass = "";

  String newPass = "";

  String renewPass = "";

  final _formKey = new GlobalKey<FormState>();

  bool showButton = false;

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
          "Đổi mật khẩu",
        ),
        actions: [
          showButton
              ? IconButton(
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //width: MediaQuery.of(context).size.width ,
                      backgroundColor: Color(0xffF6C700),
                      content: Text(
                        "Đổi mật khẩu thành công",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(milliseconds: 2200),
                    ));
                    Future.delayed(
                        Duration(milliseconds: 1500),
                        () => {
                              Navigator.pop(context),
                            });
                  },
                  icon: Icon(
                    Icons.done,
                    color: Colors.white,
                  ))
              : Text('')
        ],
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  cursorColor: Colors.white,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                      hintText: "Mật khẩu hiện tại",
                      hintStyle: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(12, 18, 12, 5),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: Color(0xff2B2B2B),
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        size: 25,
                        color: Colors.white,
                      )),
                  onChanged: (val) {
                    currentlyPass = val;
                    if (currentlyPass != "" &&
                        currentlyPass != null &&
                        renewPass != "" &&
                        renewPass != null &&
                        newPass != "" &&
                        newPass != null) {
                      setState(() {
                        showButton = true;
                      });
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  cursorColor: Colors.white,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                      hintText: "Mật khẩu mới",
                      hintStyle: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(12, 18, 12, 5),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: Color(0xff2B2B2B),
                      prefixIcon: Icon(
                        Icons.vpn_key_outlined,
                        size: 25,
                        color: Colors.white,
                      )),
                  onChanged: (val) {
                    newPass = val;
                    if (currentlyPass != "" &&
                        currentlyPass != null &&
                        renewPass != "" &&
                        renewPass != null &&
                        newPass != "" &&
                        newPass != null) {
                      setState(() {
                        showButton = true;
                      });
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Color(0xff2B2B2B),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  cursorColor: Colors.white,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                      hintText: "Nhập lại mật khẩu mới",
                      hintStyle: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(12, 18, 12, 5),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: Color(0xff2B2B2B),
                      prefixIcon: Icon(
                        Icons.vpn_key_outlined,
                        size: 25,
                        color: Colors.white,
                      )),
                  onChanged: (val) {
                    renewPass = val;
                    if (currentlyPass != "" &&
                        currentlyPass != null &&
                        renewPass != "" &&
                        renewPass != null &&
                        newPass != "" &&
                        newPass != null) {
                      setState(() {
                        showButton = true;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
