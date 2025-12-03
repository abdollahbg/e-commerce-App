import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/Cart.dart';
import 'package:ecommerce_app/models/Order.dart';
import 'package:equatable/equatable.dart';

part 'order_state.dart';

int idCounter = 0;
List<Order> orders = [];

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  void addOrder(Cart cart) {
    final order = Order(id: idCounter, cart: cart);

    idCounter++;
    orders.add(order);

    emit(AddOrder());
  }
}
