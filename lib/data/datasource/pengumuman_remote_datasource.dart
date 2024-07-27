import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../constants/variables.dart';
import '../models/response/pengumuman_response_model.dart';


class PengumumanRemoteDatasource {
  Future<Either<String, PengumumanResponseModel>> getPengumuman() async{
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/pengumuman'),
    );

    if (response.statusCode == 200){
      return right(PengumumanResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }
}