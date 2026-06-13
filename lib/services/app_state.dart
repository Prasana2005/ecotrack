import '../models/user_data.dart';

class AppState {
  static void addChallengePoints() {
    UserData.ecoPoints += 50;
    UserData.challengesCompleted += 1;
  }

  static void addHabitPoints() {
    UserData.ecoPoints += 10;
    UserData.completedHabits += 1;
  }
}
