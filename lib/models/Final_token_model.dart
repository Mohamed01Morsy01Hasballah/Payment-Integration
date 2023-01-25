class FinalTokenModel {
  FinalTokenModel({
    required this.token,
  });

  String token;

  factory FinalTokenModel.fromJson(Map<String, dynamic> json) => FinalTokenModel(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}