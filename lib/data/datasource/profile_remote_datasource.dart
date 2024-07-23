import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../constants/variables.dart';
import '../models/response/profile_responseModel.dart';


class ProfileRemoteDatasource {
  Future<Either<String, ProfileResponseModel>> getProducts() async{
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/profile'),
    );

    if (response.statusCode == 200){
      return right(ProfileResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }
}