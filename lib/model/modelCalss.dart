
//     final quizQuestions = quizQuestionsFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<QuizQuestions> quizQuestionsFromJson(String str) => List<QuizQuestions>.from(json.decode(str).map((x) => QuizQuestions.fromJson(x)));

String quizQuestionsToJson(List<QuizQuestions> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizQuestions {
    QuizQuestions({
        required this.createdAt,
        required this.name,
        required this.avatar,
        required this.questions,
        required this.id,
    });

    DateTime createdAt;
    String name;
    String avatar;
    List<Question> questions;
    String id;

    factory QuizQuestions.fromJson(Map<String, dynamic> json) => QuizQuestions(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "id": id,
    };
}

class Question {
    Question({
        required this.question,
        required this.answers,
        required this.correctIndex,
    });

    String question;
    List<String> answers;
    int correctIndex;

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json["question"],
        answers: List<String>.from(json["answers"].map((x) => x)),
        correctIndex: json["correctIndex"],
    );

    Map<String, dynamic> toJson() => {
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x)),
        "correctIndex": correctIndex,
    };
}
