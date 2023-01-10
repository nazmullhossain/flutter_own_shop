import 'dart:convert';

class User{
  final String id;
  final String name;
  final String password;
  final String email;
  final String address;
  final String type;
final String token;

User({
  required this.email,
    required this.name,
  required this.type,
  required this.id,
  required  this.password,
  required this.address,
  required this.token
});


  Map<String,dynamic>toMap(){
  return{
    "id": id,
    "email": email,
    "name": name,
    "password": password,
    "address": address,
    "type": type,
    "token": token
  };
}
factory User.fromMap(Map<String,dynamic>map){
    return User(
      id: map['_id']??'',
      email: map['email']??'',
      name: map['name']??'',
      password: map['password']??'',
      address: map['address']??'',
      type: map['type']??'',
      token: map['token']??'',

    );
}
String toJson()=>json.encode(toMap());
  factory User.fromJson(String source)=>User.fromMap(json.decode(source));

}