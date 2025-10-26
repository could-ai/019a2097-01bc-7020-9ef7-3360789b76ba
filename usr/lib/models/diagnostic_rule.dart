class DiagnosticRule {
  final String id;
  final String name;
  final List<String> symptoms;
  final List<String> tests;
  final List<String> actions;
  final double weight;

  DiagnosticRule({
    required this.id,
    required this.name,
    required this.symptoms,
    required this.tests,
    required this.actions,
    required this.weight,
  });

  factory DiagnosticRule.fromJson(Map<String, dynamic> json) {
    return DiagnosticRule(
      id: json['id'] as String,
      name: json['name'] as String,
      symptoms: List<String>.from(json['symptoms'] as List<dynamic>),
      tests: List<String>.from(json['tests'] as List<dynamic>),
      actions: List<String>.from(json['actions'] as List<dynamic>),
      weight: (json['weight'] as num).toDouble(),
    );
  }
}
