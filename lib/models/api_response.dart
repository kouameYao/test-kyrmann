class APIResponses<T> {
  T data;
  bool error; // Juste pour signaler s'il ya une erreur
  String errorMessage; // Le message de l'erreur en questu

  APIResponses({
    this.data,
    this.error = false,
    this.errorMessage,
  });
}
