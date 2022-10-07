enum RequestMethod { get, post, put, delete }
enum RequestDataType { json, formData }

class NetworkRequest {
  NetworkRequest(
      this.url,
      this.method, {
        this.data,
        this.dataType = RequestDataType.json,
        this.queryParams,
        this.headers,
      });

  final String url;
  final RequestMethod method;
  dynamic data;
  RequestDataType dataType;
  Map<String, String>? queryParams;
  Map<String, String>? headers;
}