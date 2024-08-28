import 'package:flutter/material.dart';

class CommonKeyValueRowWidget extends StatelessWidget {
  const CommonKeyValueRowWidget({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                ),
          ),
        ),
      ],
    );
  }
}
