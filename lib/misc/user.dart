class User {
  final String uid, name, img;
  User({this.uid, this.name, this.img});
}

class StudentOut {
  final String classR,
      id,
      name,
      phone,
      room,
      outTime,
      outScannedBy,
      inScannedBy,
      inTime,
      gender;

  StudentOut(
      {this.classR,
      this.id,
      this.name,
      this.phone,
      this.room,
      this.outTime,
      this.outScannedBy,
      this.inScannedBy,
      this.inTime,
      this.gender});
}

class Stats {
  int students, totalOut, out, leave;
  Stats({this.students, this.totalOut, this.out, this.leave});
}
