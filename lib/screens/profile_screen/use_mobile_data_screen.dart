import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UseMobileDataScreen extends StatefulWidget {
  const UseMobileDataScreen({Key? key}) : super(key: key);

  @override
  State<UseMobileDataScreen> createState() => _UseMobileDataScreenState();
}

class _UseMobileDataScreenState extends State<UseMobileDataScreen> {
  bool _isEnalbeButton = true;
  int indexChosed = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
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
        title: const Text(
          "Sử dụng dữ liệu di động",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF121212),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Tự động",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: indexChosed == 1 ? true : false,
                      child: const Icon(
                        Icons.check,
                        color: Color(0xFF026EEC),
                        size: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CupertinoSwitch(
                        value: _isEnalbeButton,
                        onChanged: (value) {
                          setState(() {
                            if (_isEnalbeButton == true) {
                              indexChosed = 2;
                            } else {
                              indexChosed = 1;
                            }
                            _isEnalbeButton = value;
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xFF121212),
            margin: const EdgeInsets.only(top: 5),
            child: CustomButton(
              onPress: () {
                if (_isEnalbeButton == false) {
                  setState(() {
                    indexChosed = 2;
                  });
                }
              },
              content: "Chỉ dùng Wi-fi",
              color: indexChosed != 1 ? Colors.white : Colors.white38,
              show: indexChosed == 2 ? true : false,
            ),
          ),
          Container(
            color: const Color(0xFF121212),
            margin: const EdgeInsets.only(top: 5),
            child: CustomButton(
              onPress: () {
                if (_isEnalbeButton == false) {
                  setState(() {
                    indexChosed = 3;
                  });
                }
              },
              content: "Tiết kiệm dữ liệu",
              color: indexChosed != 1 ? Colors.white : Colors.white38,
              show: indexChosed == 3 ? true : false,
            ),
          ),
          Container(
            color: const Color(0xFF121212),
            margin: const EdgeInsets.only(top: 5),
            child: CustomButton(
              onPress: () {
                if (_isEnalbeButton == false) {
                  setState(() {
                    indexChosed = 4;
                  });
                }
              },
              content: "Dữ liệu tối đa",
              color: indexChosed != 1 ? Colors.white : Colors.white38,
              show: indexChosed == 4 ? true : false,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  Function()? onPress;
  String content;
  Color color;
  bool show;
  CustomButton({
    Key? key,
    required this.onPress,
    required this.content,
    required this.color,
    required this.show,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      onPressed: widget.onPress,
      child: Container(
          color: const Color(0xFF121212),
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.content,
                style: TextStyle(
                  color: widget.color,
                  fontSize: 13,
                ),
              ),
              Visibility(
                visible: widget.show,
                child: const Icon(
                  Icons.check,
                  color: Color(0xFF026EEC),
                  size: 24,
                ),
              ),
            ],
          )),
    );
  }
}
