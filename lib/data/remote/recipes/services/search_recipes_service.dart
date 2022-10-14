import 'package:recipes_app/base/base_service.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_search_response.dart';
import 'package:recipes_app/utils/constants.dart';
import 'package:recipes_app/utils/network/api_response.dart';
import 'package:recipes_app/utils/network/end_points.dart';
import 'package:recipes_app/utils/network/network_request.dart';

class SearchRecipesService extends BaseService {

  Future<ApiResponse> getRecipesByQuery({
    required String query,
    bool? addRecipeInformation = addRecipeInformation,
    int? offset,
  }) async {
    Map<String, String> queryParameters = <String, String>{};
    queryParameters['query'] = query;
    queryParameters['addRecipeInformation'] = addRecipeInformation.toString();
    if(offset != null) queryParameters['offset'] = offset.toString();

    NetworkRequest request = NetworkRequest(
        EndPoints.search, RequestMethod.get,
        headers: await getHeaders(), queryParams: queryParameters);

    ApiResponse response = await networkManager.perform(request);

    response.data = RecipesSearchResponse.fromJson(response.data);

    return response;
  }
}
