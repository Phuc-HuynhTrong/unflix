import 'package:flutter/material.dart';
import 'package:unflix/style/text_style.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

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
        elevation: 0,
        textTheme:
            TextTheme(headline6: TextInApp().headline6(Colors.white, context)),
        backgroundColor: Colors.black,
        title: Text('Quản lý hồ sơ'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          children: [
            Icon(
              Icons.person_outline_rounded,
              size: 55.0,
              color: Colors.white,
            ),
            CustomInputTile(
              label: 'Tên',
              content: 'Kim Lơm',
            ),
            CustomInputTile(
              label: 'Email',
              content: 'alsdn',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInputTile extends StatefulWidget {
  final String label;
  final String content;

  const CustomInputTile({Key? key, required this.label, this.content = ''})
      : super(key: key);
  @override
  _CustomInputTileState createState() => _CustomInputTileState();
}

class _CustomInputTileState extends State<CustomInputTile> {
  var _controller = TextEditingController();
  bool textFieldEnable = false;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 70.0,
            margin: EdgeInsets.only(right: 5.0),
            child: Text(
              widget.label,
              style: TextStyle(
                color: Color.fromARGB(255, 122, 122, 122),
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Flexible(
            child: TextField(
              readOnly: textFieldEnable,
              style: TextStyle(
                color: Colors.white,
              ),
              keyboardType: TextInputType.text,
              controller: _controller,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 122, 122, 122),
                          width: 1.0)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          textFieldEnable = !textFieldEnable;
                        });
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
