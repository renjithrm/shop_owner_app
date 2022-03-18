import 'package:dio/dio.dart';
import 'package:showp_owner_app/helpers/api_servics_links.dart';

class ApiServics {
  final _dio = Dio();
  final _apiLink = ApiLink();
  ApiServics() {
    _dio.options = BaseOptions(
      baseUrl: _apiLink.BASE_URL,
      responseType: ResponseType.plain,
    );
  }
  Future getRespose(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (e) {
      print(e);
    }
  }

  Future postData(String url, dynamic userData) async {
    Response response;
    try {
      response = await _dio.post(
        url,
        data: userData,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print("enter unique name and email");
      }
    } catch (e) {
      print(e);
    }
  }
}
