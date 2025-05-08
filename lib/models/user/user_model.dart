import 'package:freezed_annotation/freezed_annotation.dart'; // Importing freezed_annotation package

part 'user_model.freezed.dart'; // Importing generated code for Freezed class
part 'user_model.g.dart'; // Importing generated code for JSON serialization

/// Freezed class representing a user model.
@freezed
class UserModel with _$UserModel {
  /// Factory constructor for creating a [UserModel] instance.
  factory UserModel({
    @Default('') String token, // User token
    @Default('') String error, // Error message
  }) = _UserModel; // Constructor for the freezed class

  /// Factory constructor for creating a [UserModel] instance from JSON.
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  // TODO: implement error
  String get error => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement token
  String get token => throw UnimplementedError(); // JSON deserialization method
}
