

class Data {
  String username;
  Map<int, int> weightAndTime;

  Data({
    required this.username,
    Map<int, int>? weightAndTime,
  }) : weightAndTime = weightAndTime ?? {};

  void addWeightAndTime(int weight, int time) {
    weightAndTime[time] = weight;
  }

  void removeWeightAndTime(int time) {
    weightAndTime.remove(time);
  }
}
