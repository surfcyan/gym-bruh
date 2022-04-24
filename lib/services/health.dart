import 'package:health/health.dart';

class HealthService {
// create a HealthFactory for use in the app
  HealthFactory health = HealthFactory();

  requestHealthPerms() async {
    // define the types to get
    var basicTypes = [
      HealthDataType.STEPS,
      HealthDataType.WEIGHT,
      HealthDataType.HEIGHT,
      HealthDataType.DISTANCE_WALKING_RUNNING,
      HealthDataType.FLIGHTS_CLIMBED
    ];

    // requesting access to the data types before reading them
    bool requested = await health.requestAuthorization(basicTypes);
    return requested;
  }

  Future<int?> getTotalStepsToday() async {
    var now = DateTime.now();
    var midnight = DateTime(now.year, now.month, now.day);
    int? steps = await health.getTotalStepsInInterval(midnight, now);
    return steps;
  }

  Future<double> getTotalDistanceToday() async {
    var now = DateTime.now();
    var midnight = DateTime(now.year, now.month, now.day);
    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        now.subtract(Duration(days: 1)),
        now,
        [HealthDataType.DISTANCE_WALKING_RUNNING]);
    double distCount = 0;
    for (HealthDataPoint item in healthData) {
      distCount += item.value;
    }
    return distCount;
  }
}
