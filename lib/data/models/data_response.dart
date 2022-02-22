class DataResponse<T> {
  T data;
  DateTime? updateTime;
  String? errorMassage;

  DataResponse({required this.data, this.updateTime, this.errorMassage});
}
