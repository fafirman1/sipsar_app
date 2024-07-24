import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../constants/variables.dart';
import '../models/response/guru_response_model.dart';


class GuruRemoteDatasource {
  Future<Either<String, GuruResponseModel>> getGuru() async{
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/guru'),
    );

    if (response.statusCode == 200){
      return right(GuruResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }
}