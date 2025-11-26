import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/services/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productsRepository) : super(ProductLoading());
  late final ProductsRepository _productsRepository;

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await _productsRepository.fetchProducts();

      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
