import 'package:flutter/material.dart';
import 'package:vesti_exercise/utils/constants.dart';

class IconButtons extends StatelessWidget {
  final Color iconColor,bgColor;
  final String text;
  final IconData icon;
  final Function() onPressed;

  const IconButtons({Key? key, required this.iconColor, required this.text, required this.icon, required this.bgColor, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme= Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextButton.icon(
        style: ButtonStyle(
            padding:
            MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.all(10)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(
                  color: iconColor,
                  width: 1
                ),
                borderRadius:
                BorderRadius.circular(10.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
                bgColor)),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
          size: 18,
        ),
        label: Text(text,
          style: textTheme.titleSmall?.copyWith(
              color: iconColor,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class LargeButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool whiteButton, outlineButton;
  final Color borderColor,textColor;

  const LargeButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.outlineButton = false,
    this.whiteButton = false,
    this.borderColor = darkGreen, this.textColor = mediumGreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          overlayColor: MaterialStateProperty.all<Color>(
            whiteButton
                ? kTransparent.withOpacity(0.05)
                : kPrimaryGrey.withOpacity(0.05),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            whiteButton
                ? kPrimaryWhite
                : outlineButton
                ? kPrimaryWhite
                : mediumGreen,
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: kBorderSmallRadius,
              side: BorderSide(
                width: 1,
                color: outlineButton
                    ? borderColor
                    : mediumGreen
              ),
            ),
          ),
        ),
        onPressed:  onPressed,
        child: Text(
            title,
            style: textTheme.bodyMedium?.copyWith(
              color: whiteButton || outlineButton
                  ? textColor
                  : kPrimaryWhite,
              fontSize: 16,
            ),
          ),
        ),

    );
  }
}
