import 'package:dio/dio.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/services/errorandlingMessage.dart';

class ProductsRepository {
  final Dio dio = Dio();

  ProductsRepository() {
    dio.options = BaseOptions(
      baseUrl: 'https://fakestoreapi.com',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await dio.get('/products');

      List<dynamic> jsonList = response.data;

      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception(errorHandlingMessage(e));
    } catch (e) {
      throw Exception('An unknown error occurred: $e');
    }
  }
}
