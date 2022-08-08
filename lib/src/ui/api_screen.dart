import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/api_model.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {

  ApiModel? apiModel;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: apiModel == null
                ? const Center(child: CircularProgressIndicator.adaptive())
                : ListView.builder(
                    itemCount: apiModel!.results.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          //   Text(apiModel!.results[index].id.toString()),
                          Expanded(child: Text(apiModel!.results[index].name)),
                        ],
                      );
                    })));
  }

  void _getData() async {
    String url = "http://lafyuu.qtlms.uz/api/v1/product";
    print(url);
    http.Response response = await http.get(Uri.parse(url));
    print(response.body);
    print(response.statusCode);

    apiModel = ApiModel.fromJson(json.decode(response.body));
    // apiModel = apiModelFromJson(response.body);
    setState(() {});
  }
}
