import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api_methods/api_methods.dart';
import '../../../api_methods/api_response.dart';
import '../api_methods/api_constants.dart';

class LoginRepo {
  Future<ApiResponse> loginEmailUser({
    required String userName,
    required String password,
    required String deviceId,
  }) {
    Map<String, dynamic> body = {
      "userName": userName,
      "password": password,
      // "deviceId" :deviceId,
    };

    return ApiMethods().postRequest(url: loginUserUrl, body: body).then(
          (value) => ApiResponse(
            status: value.status,
            data: value.status ? value.data : null,
            message: value.message,
            statusCode: value.statusCode,
          ),
        );
  }

/////////
}

final loginRepoProvider = Provider((ref) => LoginRepo());
