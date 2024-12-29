import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const AccountButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,width: 0.0,
          ),
          borderRadius: BorderRadius.circular(50)
        ),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            primary: Colors.black12.withOpacity(0.03),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            )
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal
            ),
          ),
        ),
      ),
    );
  }
}
