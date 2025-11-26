// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List products;
  const ProductLoaded({required this.products});
  @override
  List<Object> get props => [products];
}

class ProductError extends ProductState {
  final String message;
  const ProductError({required this.message});

  @override
  List<Object> get props => [message];
}
