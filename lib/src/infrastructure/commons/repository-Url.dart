class RepositoryUrls{
  static const String webBaseUrl = 'localhost:3000';
  static const String getUser = '/users';
  static const String postUser = '/users';
  static const String getProduct = '/products';
  static const String postProduct = '/products';
  static const String postSelectedProduct = '/choiceProducts';
  static const String getSelectedProducts = '/choiceProducts';
  static String getUserById({required int id})  => '/users/$id';
  static String patchProduct({required String id}) => '/products/$id';
  static String getProductById({required String id})  => '/products/$id';
  static String patchSelectedProduct({required String id}) => '/choiceProducts/$id';
  static String deleteSelectedProductById({required String id})  => '/choiceProducts/$id';

}