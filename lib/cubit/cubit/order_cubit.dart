import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/Cart.dart';
import 'package:ecommerce_app/models/Order.dart';
import 'package:equatable/equatable.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  void addOrder(Cart cart) {
    Order order = Order();
    order.cart.add(cart);
    emit(AddOrder(order));
  }
}
