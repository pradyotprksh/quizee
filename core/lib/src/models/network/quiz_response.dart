import 'package:json_annotation/json_annotation.dart';

part 'quiz_response.g.dart';

@JsonSerializable(explicitToJson: true)
class QuizResponse {
  QuizResponse({
    this.responseCode,
    this.results,
  });

  factory QuizResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuizResponseToJson(this);

  int responseCode;
  List<Result> results;

  QuizResponse copyWith({
    int responseCode,
    List<Result> results,
  }) =>
      QuizResponse(
        responseCode: responseCode ?? this.responseCode,
        results: results ?? this.results,
      );
}

@JsonSerializable()
class Result {
  Result({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  String category;
  Type type;
  Difficulty difficulty;
  String question;
  @JsonKey(name: 'correct_answer')
  String correctAnswer;
  @JsonKey(name: 'incorrect_answers')
  List<String> incorrectAnswers;

  Result copyWith({
    String category,
    Type type,
    Difficulty difficulty,
    String question,
    String correctAnswer,
    List<String> incorrectAnswers,
  }) =>
      Result(
        category: category ?? this.category,
        type: type ?? this.type,
        difficulty: difficulty ?? this.difficulty,
        question: question ?? this.question,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
      );
}

enum Difficulty { medium }

enum Type { multiple }
