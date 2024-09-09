import 'package:flutter/material.dart';

class RUButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const RUButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          highlightColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(25),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // Adjust the font size as needed
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
