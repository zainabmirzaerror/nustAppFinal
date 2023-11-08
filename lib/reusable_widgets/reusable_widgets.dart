import 'package:flutter/material.dart';

Image logoWidget(String imageName, double wid, double hei) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: wid,
    height: hei,
  );
}

Container resuableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return Container(
      height: 42.5,
      width: 270,
      child: TextField(
        controller: controller,
        obscureText: isPasswordType,
        enableSuggestions: !isPasswordType,
        autocorrect: !isPasswordType,
        cursorColor: Colors.white,
        style: TextStyle(color: Color(0xFF005894), fontSize: 16),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(),
          prefixIcon: Icon(
            icon,
            color: Color(0xFF005894),
          ),
          labelText: text,
          labelStyle: TextStyle(
              color: Color(0xFF005894), fontSize: 16, fontFamily: "Cupertino"),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.white.withOpacity(0.3),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide:
                  BorderSide(width: 1.5, color: Colors.grey.withOpacity(0.5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(width: 1.5, color: Color(0xFF005894))),
        ),
        keyboardType: isPasswordType
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
      ));
}

Container whiteButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 40,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Color(0xFF276FA0),
            fontWeight: FontWeight.bold,
            fontSize: 17),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color(0xFF276FA0);
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

Container blueButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: 150,
    height: 40,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color(0xFF276FA0);
            }
            return Color(0xFF276FA0);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
