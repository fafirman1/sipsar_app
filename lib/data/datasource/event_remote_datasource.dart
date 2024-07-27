import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../constants/variables.dart';
import '../models/response/event_response_model.dart';


class EventRemoteDatasource {
  Future<Either<String, EventResponseModel>> getGuru() async{
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/event'),
    );

    if (response.statusCode == 200){
      return right(EventResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }
}