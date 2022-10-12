import 'package:recipes_app/base/base_service.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_search_response.dart';
import 'package:recipes_app/utils/constants.dart';
import 'package:recipes_app/utils/network/api_response.dart';
import 'package:recipes_app/utils/network/end_points.dart';
import 'package:recipes_app/utils/network/network_request.dart';

import '../models/recipes_search_suggestion.dart';

class SearchSuggestionsService extends BaseService {
  Future<ApiResponse> getSearchSuggestions({
    required String query,
  }) async {
    Map<String, String> queryParameters = <String, String>{};
    queryParameters['query'] = query;

    NetworkRequest request = NetworkRequest(
        EndPoints.autocomplete, RequestMethod.get,
        headers: await getHeaders(), queryParams: queryParameters);

    ApiResponse response = await networkManager.perform(request);

    response.data = searchSuggestionFromJson(response.data);

    return response;
  }
}