class About {
  String? logo;
  String? logoText;
  String? profile;
  String? aboutText;
  String? email;

  About({this.logo, this.logoText, this.profile, this.aboutText, this.email});

  About.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    logoText = json['logoText'];
    profile = json['profile'];
    aboutText = json['aboutText'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['logo'] = logo;
    data['logoText'] = logoText;
    data['profile'] = profile;
    data['aboutText'] = aboutText;
    data['email'] = email;
    return data;
  }
}
