import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yt_ecommerce_admin_panel/feature/dashboard%20screen/data/model/product_model.dart';

part 'table_controller_state.dart';

class TableControllerCubit extends Cubit<TableControllerState> {
  TableControllerCubit() : super(TableControllerState());
  List<ProductModel> allProducts = const [];
  Timer? _debounce;

  void loadProducts(List<ProductModel> products) {
    emit(state.copyWith(
        allData: products,
        filteredData: products,
        status: TableStatus.loaded
    ));
  }

  void search(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      final filtered = state.allData.where((item) =>
          (item.name ?? '').toLowerCase().contains(query.toLowerCase())).toList();
      emit(state.copyWith(filteredData: filtered));
    });
  }

  void sort(int columnIndex, bool ascending) {
    final sortedList = List<ProductModel>.from(state.filteredData);

    sortedList.sort((a, b) {
      final comparison = columnIndex == 0
          ? (a.name ?? '').compareTo(b.name ?? '')
          : a.price.compareTo(b.price);
      return ascending ? comparison : -comparison;
    });

    emit(state.copyWith(
      filteredData: sortedList,
      sortAscending: ascending,
      sortColumnIndex: columnIndex,
    ));
  }

  void toggleSelection(String id, bool selected) {
    final updatedSelection = List<String>.from(state.selectedRows);
    selected ? updatedSelection.add(id) : updatedSelection.remove(id);
    emit(state.copyWith(selectedRows: updatedSelection));
  }

  void toggleAll(bool? selected) {
    final allIds = selected == true
        ? state.filteredData.map((e) => e.id ?? '').toList()
        : <String>[];
    emit(state.copyWith(selectedRows: allIds));
  }
}