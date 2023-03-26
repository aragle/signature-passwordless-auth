class Activity {
  final int id;
  final int icon;
  final String title;
  final String description;
  final DateTime date;
  final double latitude;
  final double longitude;
  final String address;

  Activity({
    required this.id,
    required this.icon,
    required this.title,
    required this.description,
    required this.date,
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}
