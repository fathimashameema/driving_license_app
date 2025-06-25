import 'package:flutter/material.dart';

class ExamOptionTile extends StatelessWidget {
  final int index;
  final String text;
  final bool selected;
  final bool isCorrect; // Add this parameter
  final VoidCallback onTap;

  const ExamOptionTile({
    super.key,
    required this.index,
    required this.text,
    required this.selected,
    required this.isCorrect, // Include it here
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the color based on correctness and selection
    final Color tileColor =
        isCorrect ? Colors.green : (selected ? Colors.red : Colors.transparent);

    final Color borderColor =
        isCorrect ? Colors.green : (selected ? Colors.red : Colors.white);

    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor),
        padding: const EdgeInsets.all(14),
        backgroundColor: tileColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );

    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white),
        padding: const EdgeInsets.all(14),
        backgroundColor: tileColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
