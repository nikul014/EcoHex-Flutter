import 'dart:convert';

// WeeklyChallenge model
class WeeklyChallenge {
  final String challengeId;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final int pointsForCompletion;
  final List<ImpactDetail> impactDetails;
  final List<QuizQuestion> quizQuestions;

  WeeklyChallenge({
    required this.challengeId,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.pointsForCompletion,
    required this.impactDetails,
    required this.quizQuestions,
  });

  factory WeeklyChallenge.fromJson(Map<String, dynamic> json) {
    var listImpactDetails = json['impactDetails'] as List;
    List<ImpactDetail> impactDetailsList =
        listImpactDetails.map((item) => ImpactDetail.fromJson(item)).toList();

    var listQuizQuestions = json['quizQuestions'] as List;
    List<QuizQuestion> quizQuestionsList =
        listQuizQuestions.map((item) => QuizQuestion.fromJson(item)).toList();

    return WeeklyChallenge(
      challengeId: json['challengeId'],
      title: json['title'],
      description: json['description'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      pointsForCompletion: json['pointsForCompletion'],
      impactDetails: impactDetailsList,
      quizQuestions: quizQuestionsList,
    );
  }
}

// ImpactDetail model
class ImpactDetail {
  final String pageTitle;
  final String image;
  final String text;

  ImpactDetail({
    required this.pageTitle,
    required this.image,
    required this.text,
  });

  factory ImpactDetail.fromJson(Map<String, dynamic> json) {
    return ImpactDetail(
      pageTitle: json['pageTitle'],
      image: json['image'],
      text: json['text'],
    );
  }
}

// QuizQuestion model
class QuizQuestion {
  final String question;
  final List<String> options;
  final String correctAnswer;
  final int points;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.points,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    var listOptions = json['options'] as List;
    List<String> optionsList = List<String>.from(listOptions);

    return QuizQuestion(
      question: json['question'],
      options: optionsList,
      correctAnswer: json['correctAnswer'],
      points: json['points'],
    );
  }
}

// Wrapper class for the response
class WeeklyChallengeResponse {
  final List<WeeklyChallenge> weeklyChallenges;

  WeeklyChallengeResponse({
    required this.weeklyChallenges,
  });

  factory WeeklyChallengeResponse.fromJson(Map<String, dynamic> json) {
    var listChallenges = json['weeklyChallenges'] as List;
    List<WeeklyChallenge> challengesList =
        listChallenges.map((item) => WeeklyChallenge.fromJson(item)).toList();

    return WeeklyChallengeResponse(
      weeklyChallenges: challengesList,
    );
  }
}

// Parsing function
WeeklyChallengeResponse parseWeeklyChallenges(String jsonString) {
  final Map<String, dynamic> parsed = json.decode(jsonString);
  return WeeklyChallengeResponse.fromJson(parsed);
}
