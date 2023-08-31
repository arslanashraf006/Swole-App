class Signin {
  Data? data;

  Signin({this.data});

 factory Signin.fromJson(Map<String, dynamic> json) {
   return Signin(data: json['data'] != null ? Data.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic accessToken;
  int? expires;
  dynamic refreshToken;

  Data({this.accessToken, this.expires, this.refreshToken});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        accessToken : json['access_token'],
        expires : json['expires'],
        refreshToken : json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['expires'] = expires;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
