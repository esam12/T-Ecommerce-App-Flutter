import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco/utils/formatters/formatter.dart';

class UserModel {
  // Keep those values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String email;
  final String userName;
  String phoneNumber;
  String profilePicture;

  // Contructor for UserModel
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userName,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name of the user
  String get fullName => '$firstName $lastName';

  /// Helper function to format the phone number.
  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name into first name and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Static function to generate a username from the full name.
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName =
        "$firstName$lastName"; // Combined first and last name
    String userNameWithPrefix = "cwt_$camelCaseUserName"; // Prefix with cwt_

    return userNameWithPrefix;
  }

  /// Static function to create an empty UserModel
  static UserModel empty() {
    return UserModel(
      id: "",
      firstName: "",
      lastName: "",
      email: "",
      userName: "",
      phoneNumber: "",
      profilePicture: "",
    );
  }

  /// Convert model to json structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'UserName': userName,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// Factory Method to create a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        email: data['Email'] ?? '',
        userName: data['UserName'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else{
      return UserModel.empty();
    }
  }
}
