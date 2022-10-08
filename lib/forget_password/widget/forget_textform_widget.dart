import 'package:flutter/material.dart';
import 'package:the_new_pitchapp/utility/colors.dart';

class ForgotTextformWidget extends StatelessWidget {
  const ForgotTextformWidget({Key? key, this.hintText}) : super(key: key);
  final String? hintText;

  customBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: TextFormField(
            obscureText: hintText == 'Password'?true:false,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              fillColor: Colors.white,
                labelText: hintText,
                hintText: hintText,
              suffixText: '*',
              suffixStyle: TextStyle(
                color: Colors.red,
              ),
              suffixIcon: hintText == 'Password'?IconButton(
                  icon: Icon(
                   /* loginCtrl.passwordInVisible
                        ? Icons.visibility_off
                        : */Icons.visibility,
                    //change icon based on boolean value
                    color: Colors.grey
                  ),
                  onPressed: () {
                   // loginCtrl.togglePassword();
                  }):SizedBox.shrink(),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.normal,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(
            color: buttonColor,
            width: 1.0,
          ),
        ),

            )));
  }
}
