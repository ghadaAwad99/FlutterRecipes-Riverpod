import 'package:recipes_app/base/base_service.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/utils/network/api_response.dart';
import 'package:recipes_app/utils/network/end_points.dart';
import 'package:recipes_app/utils/network/network_request.dart';

class SuggestedRecipesService extends BaseService {

  Future<ApiResponse> getSuggestedRecipes() async {

    Map<String, String> queryParameters = <String, String>{};
    queryParameters['number'] = "5";

    NetworkRequest networkRequest = NetworkRequest(
        EndPoints.suggestedRecipes, RequestMethod.get,
        headers: await getHeaders(), queryParams: queryParameters
    );

    var response = await networkManager.perform(networkRequest);

    response.data = RecipesResponse.fromJson(response.data);

    return response;
  }

}
