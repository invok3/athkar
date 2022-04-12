import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final Function() ontap;
  final bool filled;
  final Widget? icon;
  const CustomOutlinedButton({
    Key? key,
    required this.text,
    required this.ontap,
    this.filled = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: filled ? Provider.of<ThemeProvider>(context).kPrimary : null,
        border: Border.all(
            width: 1, color: Provider.of<ThemeProvider>(context).kPrimary),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(32), topLeft: Radius.circular(32)),
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32), topLeft: Radius.circular(32)),
        ),
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: filled
                    ? TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)
                    : TextStyle(
                        color: Provider.of<ThemeProvider>(context).kPrimary),
              ),
              SizedBox(width: icon == null ? 0 : 16),
              icon == null ? SizedBox() : icon!,
            ],
          ),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function() ontap;
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Provider.of<ThemeProvider>(context).accentColor,
        border: Border.all(
            width: 1, color: Provider.of<ThemeProvider>(context).accentColor),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(32), topLeft: Radius.circular(32)),
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32), topLeft: Radius.circular(32)),
        ),
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
