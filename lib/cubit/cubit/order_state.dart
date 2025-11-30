part of 'order_cubit.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class AddOrder extends OrderState {
  final Order order;
  const AddOrder(this.order);

  @override
  List<Object> get props => [order];
}
