class DataResponse<T> {
  T data;
  String? errorMassage;

  DataResponse(this.data, [this.errorMassage]);
}
