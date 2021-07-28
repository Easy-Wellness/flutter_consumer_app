/// In the returned list of points, two adjacent points are always
/// [interval] between each other. Only use this util when u work with time in
/// seconds (unit of measurement).
///
/// By default, each time interval is equal to 1800 seconds (30 minutes). The
/// returned list of points are arranged in ascending order from
/// [startTimeInSecs] to [endTimeInSecs]
List<int> getTimesInSecsFromRange(int startTimeInSecs, int endTimeInSecs,
    [int interval = 1800]) {
  final List<int> points = [];
  int endPoint = startTimeInSecs;
  while (endPoint <= endTimeInSecs) {
    points.add(endPoint);
    endPoint += interval;
  }
  return points;
}
