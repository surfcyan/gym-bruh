List home_categories = [
  {
    'title': 'Progression Log',
    'bg_img':
        'https://firebasestorage.googleapis.com/v0/b/gym-bruh.appspot.com/o/home%2Fproglog.jpeg?alt=media&token=8947d954-6372-4933-8116-08d11130d68e'
  },
  {
    'title': 'Exercises',
    'bg_img':
        'https://firebasestorage.googleapis.com/v0/b/gym-bruh.appspot.com/o/home%2Fexercises.jpeg?alt=media&token=665797da-9c05-4049-9e77-5c4574a3dc52'
  },
  {
    'title': 'Nutrition',
    'bg_img':
        'https://firebasestorage.googleapis.com/v0/b/gym-bruh.appspot.com/o/home%2Fnutrition.jpeg?alt=media&token=c2f4e8f2-0f05-487c-8924-1c76fc281347'
  },
  {
    'title': 'Yoga',
    'bg_img':
        'https://firebasestorage.googleapis.com/v0/b/gym-bruh.appspot.com/o/home%2Fyoga.webp?alt=media&token=c850d312-08e6-495a-90ec-dba08d397acf'
  },
];

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
