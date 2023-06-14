class UserModel {
  late String id;
  late String firstName;
  late String lastName;
  late String userName;
  late String phoneNumber;
  late String email;
  late List lessonProgress;
  late List challengeProgress;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.phoneNumber,
      required this.email,
      required this.lessonProgress,
      required this.challengeProgress});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['username'];
    phoneNumber = json['phone'];
    email = json['email'];
    lessonProgress = json['lesson_progress'];
    challengeProgress = json['challenge_progress'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'userName': userName,
        'phoneNumber': phoneNumber,
        'email': email,
        'lessonProgress': lessonProgress,
        'challengeProgress': challengeProgress,
      };
}
