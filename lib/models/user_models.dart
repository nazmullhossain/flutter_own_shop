import 'dart:convert';

class User{
  final String id;
  final String name;
  final String password;
  final String email;
  final String address;
  final String type;
final String token;
final List<dynamic> cart;

User({
  required this.email,
    required this.name,
  required this.type,
  required this.id,
  required  this.password,
  required this.address,
  required this.token,
  required this.cart
});


  Map<String,dynamic>toMap(){
  return{
    "id": id,
    "email": email,
    "name": name,
    "password": password,
    "address": address,
    "type": type,
    "token": token,
    "cart": cart,
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
      cart: List<Map<String,dynamic>>.from(
          map['cart']?.map((x)=>Map<String,dynamic>.from(x)))

    );
}
String toJson()=>json.encode(toMap());
  factory User.fromJson(String source)=>User.fromMap(json.decode(source));

  User copyWith({
  String ?id,
    String ? name,
    String? email,
    String? password,
    String? address,
    String ?type,
    String ?token,
    List<dynamic>?cart,
}){
    return User(
        email: email ?? this.email,
        name: name ?? this.name,
        type: type?? this.type,
        id: id ?? this.id,
        password: password ?? this.password,
        address: address ?? this.address,
        token: token ?? this.token,
        cart: cart ?? this.cart);
  }

}