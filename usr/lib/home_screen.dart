import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/diagnostic_rule.dart';
import 'package:couldai_user_app/data/rules_data.dart';
import 'package:couldai_user_app/rule_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<DiagnosticRule> _rules;

  @override
  void initState() {
    super.initState();
    _rules = loadRules();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Industrial Diagnostics'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: _rules.length,
        itemBuilder: (context, index) {
          final rule = _rules[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(rule.name),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RuleDetailsScreen(rule: rule),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
