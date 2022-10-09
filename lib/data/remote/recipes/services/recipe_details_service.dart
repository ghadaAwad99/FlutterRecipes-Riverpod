import 'package:recipes_app/base/base_service.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/utils/network/api_response.dart';
import 'package:recipes_app/utils/network/end_points.dart';
import 'package:recipes_app/utils/network/network_request.dart';

class RecipeDetailsService extends BaseService {
  Future<ApiResponse> getRecipeDetails({
    required String recipeId,
  }) async {

    NetworkRequest request = NetworkRequest(
        "/$recipeId${EndPoints.information}", RequestMethod.get,
        headers: await getHeaders());

    ApiResponse response = await networkManager.perform(request);

    response.data = Recipe.fromJson(response.data);

    return response;
  }
}