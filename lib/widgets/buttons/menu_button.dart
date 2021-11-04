import 'package:flutter/material.dart';


class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key, required this.name, required this.press,
    this.needIcon = false,
  }) : super(key: key);
  final String name;
  final Function press;
  final bool needIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:  press as void Function()?,
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          )
      ),
      child: Container(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Text(
                name,
                style: TextStyle(
                  color: Color(0xFF12121D),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),

            ),
            if(needIcon == true)
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.black,),
          ],
        ),
      ),
    );
  }
}