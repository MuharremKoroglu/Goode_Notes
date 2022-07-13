class Items {
  final String title;
  bool isDone;
  Items({required this.title, this.isDone = false});

  void toogleStatus() {
    //notes can change its status with this method
    isDone = !isDone;
  }

  Items.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        isDone = map['isDone'];

  Map<String, dynamic> toMap() => {'title': title, 'isDone': isDone};
}
