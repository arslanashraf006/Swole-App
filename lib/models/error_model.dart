class Errors {
  dynamic error;

  Errors({
    required this.error,
  });

  factory Errors.fromJson(Map<String,dynamic> jsonData) {
    return Errors(
      error: jsonData["error"],
    );
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> map ={};
    map["error"] = error;
    return map;
  }
}