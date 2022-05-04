import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yeva/models/categories.dart';
import 'dart:convert';
import 'package:yeva/models/user.dart';

class YevaController {
  static List<String> api = [
    "https://imfcconsulting.com/lerProduto.php?role=userLogin",
    "https://imfcconsulting.com/lerProduto.php?role=getUsers",
    "https://imfcconsulting.com/lerProduto.php?role=getProduto",
    "https://imfcconsulting.com/lerProduto.php?role=getCategoria",
  ];

  static Future<String> loginUser(String user, String senha) async {
    try {
      final url = Uri.parse(api[0]);

      final response = await http.post(url,
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode(<String, String>{'username': user, 'senha': senha}));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error $e";
    }
  }

  static Future<List<User>> getUsuarios() async {
    var url = Uri.parse(api[1]);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //print("Resposta da requisição getUsuarios: >>>>> ${response.statusCode}");
      return parseResponse(response.body);
    } else {
      return <User>[];
    }
  }

  static List<User> parseResponse(String body) {
    final p = jsonDecode(body).cast<Map<String, dynamic>>();
    return p.map<User>((json) => User.fromJson(json)).toList();
  }

  static Future<List<Categorias>> getCategorias() async {
    try {
      final response = await http.get(Uri.parse(api[3]));

      if (response.statusCode == 200) {
        final pa = jsonDecode(response.body);

        return pa;
      } else {
        return <Categorias>[];
      }
    } catch (e) {
      return <Categorias>[];
    }
  }
}
