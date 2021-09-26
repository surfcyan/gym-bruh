class HomeLogic {
  int day = DateTime.now().weekday;

  // Get Todays Week Day
  String getDayOfWeek() {
    if (day == 1)
      return 'Monday';
    else if (day == 2)
      return 'Tuesday';
    else if (day == 3)
      return 'Wednesday';
    else if (day == 4)
      return 'Thursday';
    else if (day == 5)
      return 'Friday';
    else if (day == 6)
      return 'Saturday';
    else
      return 'Sunday';
  }

// Get Gym's Day
  String getGymDay() {
    if (day == 1)
      return 'Chest & Tricep';
    else if (day == 2)
      return 'Back & Bicep';
    else if (day == 3)
      return 'Leg & Shoulder';
    else if (day == 4)
      return 'Chest & Tricep';
    else if (day == 5)
      return 'Back & Bicep';
    else if (day == 6)
      return 'Leg & Shoulder';
    else
      return 'Rest';
  }
}
