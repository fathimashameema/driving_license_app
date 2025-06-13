import 'package:avtoskola_varketilshi/Models/review_question_model.dart';
import 'package:flutter/material.dart';

class ReviewQuestionTile extends StatelessWidget {
  final ReviewQuestionModel question;
  final VoidCallback onToggle;

  const ReviewQuestionTile({
    super.key,
    required this.question,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Text('#${question.id}', style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              GestureDetector(
                onTap: onToggle,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(Icons.expand_more, color: Colors.red, size: 20),
                ),
              ),
            ],
          ),
        ),
        if (question.isExpanded)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (question.imageUrl != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset('assets/images/1.png', fit: BoxFit.cover),
                  ),
                const SizedBox(height: 10),
                Text(
                  question.question,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ...List.generate(question.options.length, (i) {
                  final isCorrect = i == question.correctIndex;
                  final isSelected = i == question.selectedIndex;
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isCorrect ? Colors.green : isSelected ? Colors.red : Colors.transparent,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 26,
                          height: 26,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${i + 1}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            question.options[i],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          )
      ],
    );
  }
}
