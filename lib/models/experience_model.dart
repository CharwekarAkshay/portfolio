class ExperienceModel {
  final String designation;
  final String startDate;
  final String endDate;
  final String companyName;
  final String companyLink;
  final List<String> workExperience;
  final String clientName;

  final bool hasMultipleDesignation;
  final List<ExperienceModel> otherWorkExperience;

  ExperienceModel({
    required this.designation,
    required this.startDate,
    required this.endDate,
    required this.companyName,
    required this.companyLink,
    required this.workExperience,
    this.hasMultipleDesignation = false,
    this.otherWorkExperience = const [],
    this.clientName = '',
  });
}
