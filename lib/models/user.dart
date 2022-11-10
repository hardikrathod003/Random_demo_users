class User {
  String nameTitle;
  String firstName;
  String lastName;
  String password;
  String email;
  String phone;
  String country;
  String pincode;
  String gender;
  String userName;
  String imageUrl;
  int age;
  String city;
  String state;
  String uuid;
  String area;

  User({
    required this.nameTitle,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.userName,
    required this.phone,
    required this.uuid,
    required this.area,
    required this.city,
    required this.state,
    required this.imageUrl,
    required this.age,
    required this.country,
    required this.pincode,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      nameTitle: data['name']['title'],
      firstName: data['name']['first'],
      lastName: data['name']['last'],
      age: data['dob']['age'],
      city: data['location']['city'],
      state: data['location']['state'],
      country: data['location']['country'],
      gender: data['gender'],
      userName: data['login']['username'],
      password: data['login']['password'],
      uuid: data['login']['uuid'],
      email: data['email'],
      phone: data['phone'],
      imageUrl: data['picture']['large'],
      area:
          "${data['location']['street']['number'].toString()} ${data['location']['street']['name']}",
      pincode: data['location']['postcode'].toString(),
    );
  }
}
