class Signup {
  Data? data;

  Signup({this.data});

  factory Signup.fromJson(Map<String, dynamic> json) {
   return Signup(data: json['data'] != null ? Data.fromJson(json['data']) : null);
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
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  dynamic location;
  dynamic title;
  dynamic description;
  dynamic tags;
  dynamic avatar;
  dynamic language;
  String? theme;
  dynamic tfaSecret;
  String? status;
  String? role;
  dynamic token;
  dynamic lastAccess;
  dynamic lastPage;
  String? provider;
  dynamic externalIdentifier;
  dynamic authData;
  dynamic emailNotifications;
  dynamic dob;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.location,
        this.title,
        this.description,
        this.tags,
        this.avatar,
        this.language,
        this.theme,
        this.tfaSecret,
        this.status,
        this.role,
        this.token,
        this.lastAccess,
        this.lastPage,
        this.provider,
        this.externalIdentifier,
        this.authData,
        this.emailNotifications,
        this.dob});

 factory Data.fromJson(Map<String, dynamic> json) {
   return Data(
       id : json['id'],
       firstName : json['first_name'],
       lastName : json['last_name'],
       email : json['email'],
       password : json['password'],
       location : json['location'],
       title : json['title'],
       description : json['description'],
       tags : json['tags'],
       avatar : json['avatar'],
       language : json['language'],
       theme : json['theme'],
       tfaSecret : json['tfa_secret'],
   status : json['status'],
   role : json['role'],
   token : json['token'],
   lastAccess : json['last_access'],
   lastPage : json['last_page'],
   provider : json['provider'],
   externalIdentifier : json['external_identifier'],
   authData : json['auth_data'],
       emailNotifications : json['email_notifications'],
       dob : json['dob'],
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['location'] = location;
    data['title'] = title;
    data['description'] = description;
    data['tags'] = tags;
    data['avatar'] = avatar;
    data['language'] = language;
    data['theme'] = theme;
    data['tfa_secret'] = tfaSecret;
    data['status'] = status;
    data['role'] = role;
    data['token'] = token;
    data['last_access'] = lastAccess;
    data['last_page'] = lastPage;
    data['provider'] = provider;
    data['external_identifier'] = externalIdentifier;
    data['auth_data'] = authData;
    data['email_notifications'] = emailNotifications;
    data['dob'] = dob;
    return data;
  }
}
