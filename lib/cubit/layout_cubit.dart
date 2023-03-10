import 'dart:convert';

import 'package:anther/cubit/layout_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  Future<Map<String, dynamic>> register({
    required String title,
    required String price,
    required String desc,
  }) async {
    emit(RegisterLoadingState());
    Response response = await http
        .post(Uri.parse('https://fakestoreapi.com/products'), body: {
      'title': title,
      'price': price,
      'description': desc,
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      emit(RegisterSuccessState());
      return data;
    } else {
      emit(RegisterFailureState());
      return throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
