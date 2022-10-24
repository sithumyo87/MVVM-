import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class User{
  int? id;
  String? name,username,email,phone,website;
  Address? address;
  Company? company;

  User({required this.id,required this.name,required this.username,required this.email,required this.phone,required this.website,required this.address,required this.company});

  factory User.fromJson(dynamic json){
    Address address = Address.fromJson(json['address']);
    Company company = Company.fromJson(json['company']);
    return User(id: json['id'], name: json['name'], username: json['username'], email: json['email'], phone: json['phone'], website: json['website'], address: address, company: company);
  }


}

class Address{
  String? street,suite,city,zipcode;
  Geo? geo;

  Address({required this.street,required this.suite,required this.city,required this.zipcode,required this.geo});

  factory Address.fromJson(dynamic json){
    Geo geo = Geo.fromJson(json['geo']);
    return Address(street: json['street'], suite: json['suite'], city: json['city'], zipcode: json['zipcode'],geo: geo);
  }
}

class Geo{
  String? lat,lng;
  Geo({required this.lat,required this.lng});
  
  factory Geo.fromJson(dynamic json){
    return Geo(lat: json['lat'],lng:json['lng']);
  }
}

class Company{
  String? name,catchPhrase,bs;

  Company({required this.name,required this.catchPhrase,required this.bs});

  factory Company.fromJson(dynamic json){
    return Company(name: json['name'], catchPhrase: json['catchPhrase'], bs: json['bs']);
  }
}




// },