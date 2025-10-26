import 'dart:convert';
import 'package:couldai_user_app/models/diagnostic_rule.dart';

const String rulesJsonData = '''
{
  "rules": [
    {
      "id": "motor_overload",
      "name": "Motor Overload",
      "symptoms": ["motor_heats_up", "trips_overload_relay", "reduced_speed", "burning_smell"],
      "tests": ["Check motor current with clamp meter", "Inspect load mechanical jam", "Verify ventilation"],
      "actions": ["Reduce load", "Repair mechanical jam", "Replace motor if insulation damaged"],
      "weight": 1.0
    },
    {
      "id": "short_circuit_phase_to_phase",
      "name": "Short Circuit (Phase-Phase)",
      "symptoms": ["blown_fuse", "tripped_mcb", "arcing_sounds", "smoke"],
      "tests": ["Visual inspection for burned conductors", "Measure continuity between phases with power off"],
      "actions": ["Isolate supply", "Replace damaged cables/fuses", "Find & repair shorted components"],
      "weight": 1.2
    },
    {
      "id": "earth_fault",
      "name": "Earth Fault (Ground Fault)",
      "symptoms": ["residual_current_trip", "leakage_current_detected", "fuses_not_blown_but_trips"],
      "tests": ["Insulation test (megger)", "Visual inspect insulation", "Measure leakage to earth"],
      "actions": ["Repair insulation", "Correctly route cables", "Install/verify RCD"],
      "weight": 1.0
    },
    {
      "id": "phase_loss",
      "name": "Phase Loss / Single Phasing",
      "symptoms": ["reduced_power", "motor_overheating", "vibrations", "motor_starts_slow"],
      "tests": ["Check phase voltages at load", "Verify upstream supply and fuses"],
      "actions": ["Restore missing phase", "Replace blown fuse", "Use phase failure relays"],
      "weight": 1.1
    },
    {
      "id": "undervoltage",
      "name": "Undervoltage",
      "symptoms": ["low_voltage", "motor_stalls", "lights_dim"],
      "tests": ["Measure supply voltage under load", "Check upstream transformer taps"],
      "actions": ["Correct supply voltage", "Inspect transformer/taps", "Reduce load"],
      "weight": 0.9
    },
    {
      "id": "contactor_coil_failure",
      "name": "Contactor Coil Failure",
      "symptoms": ["contactor_not_pull_in", "no_output_to_motor_when_commanded", "coil_hot"],
      "tests": ["Measure coil resistance", "Check coil supply voltage"],
      "actions": ["Replace contactor coil", "Check control circuit and fuses"],
      "weight": 1.0
    },
    {
      "id": "plc_comm_failure",
      "name": "PLC Communication Failure",
      "symptoms": ["no_response_from_plc", "io_not_updating", "hmi_comm_error"],
      "tests": ["Ping PLC if networked", "Check serial/fieldbus wiring", "Inspect PLC error LEDs"],
      "actions": ["Restart PLC", "Replace faulty comms cable", "Restore program/backups"],
      "weight": 1.0
    },
    {
      "id": "fuse_blown",
      "name": "Blown Fuse",
      "symptoms": ["no_power_in_branch", "fuse_open_circuit", "downstream_devices_dead"],
      "tests": ["Measure continuity across fuse", "Inspect for visible damage"],
      "actions": ["Replace fuse with correct rating", "Find cause of overcurrent"],
      "weight": 0.8
    }
  ]
}
''';

List<DiagnosticRule> loadRules() {
  final parsed = json.decode(rulesJsonData);
  final List<dynamic> rulesList = parsed['rules'];
  return rulesList.map((json) => DiagnosticRule.fromJson(json)).toList();
}
