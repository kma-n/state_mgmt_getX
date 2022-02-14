import 'package:getx_state_practise/models/item_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ApiService {
  List<Items> items = [];
  final _baseUrl = "https://fakestoreapi.com/products";
  Future<List<Items>> fetchList() async {
    List data;
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      data = convert.jsonDecode(response.body);
      items = data.map((e) => Items.fromJson(e)).toList();
      return items;
    } else {
      throw Exception('Error');
    }
  }
}
