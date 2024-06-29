class Question {
  final String id;
  final String question;
  final String answer;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final List<String> choices;

  Question({
    required this.id,
    required this.question,
    required this.answer,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.choices,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['_id'] ?? '',
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
      image: json['image'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'] ?? '',
      choices: List<String>.from(json['choices'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'question': question,
      'answer': answer,
      'image': image,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
      'choices': choices,
    };
  }
}
class QuestionList {
  final List<Question> questions;

  QuestionList({
    required this.questions,
  });

  factory QuestionList.fromJson(Map<String, dynamic> json) {
    return QuestionList(
      questions: (json['questions'] as List)
          .map((questionJson) => Question.fromJson(questionJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questions': questions.map((question) => question.toJson()).toList(),
    };
  }
}
