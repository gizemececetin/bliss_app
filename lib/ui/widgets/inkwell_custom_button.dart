import 'package:flutter/material.dart';
class InkwellCustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const InkwellCustomButton(
      {Key key,
        this.onPressed,
        this.buttonText,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPressed,
      child: Container(
        padding:
        EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.white, width: 2),
            //color: colorPrimaryShade,
            borderRadius: BorderRadius.all(
                Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily:
                    "Quicksand-SemiBold"),
              )),
        ),
      ),
    );
  }
}
