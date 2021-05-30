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
      scannedBy,
      inTime,
      gender;

  StudentOut(
      {this.classR,
      this.id,
      this.name,
      this.phone,
      this.room,
      this.outTime,
      this.scannedBy,
      this.inTime,
      this.gender});
}
