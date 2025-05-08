import 'package:sample_mvvm_bloc/config/app_url.dart';
import 'package:sample_mvvm_bloc/data/network/network_services_api.dart';
import 'package:sample_mvvm_bloc/models/user/user_model.dart';
import 'package:sample_mvvm_bloc/repository/auth/login_repository.dart';

class LoginHttpApiRepository implements LoginRepository {
  final _api = NetworkServicesApi();

  @override
  Future<UserModel> loginApi(dynamic data) async {
    final response = await _api.postApi(AppUrl.loginApiUrl, data);
    if (response != null) {
      return UserModel.fromJson(response);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
