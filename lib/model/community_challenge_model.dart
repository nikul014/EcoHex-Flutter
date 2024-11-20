class CommunityChallenge {
  final String challengeName;
  final String image;
  final String startDate;
  final String endDate;
  final String points;
  final String locationAddress;
  final String? startTime;
  final String? endTime;
  final String description;

  CommunityChallenge({
    required this.challengeName,
    required this.image,
    required this.startDate,
    required this.endDate,
    required this.points,
    required this.locationAddress,
    this.startTime,
    this.endTime,
    required this.description,
  });
}
