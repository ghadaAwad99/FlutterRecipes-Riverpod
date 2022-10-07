class ApiResponse {
  dynamic data;
  late Status status;
  String? error;

  ApiResponse.success(this.data) {
    status = Status.OK;
  }

  ApiResponse.failed(String this.error) {
    status = Status.FAILED;
  }
}

enum Status { OK, FAILED }