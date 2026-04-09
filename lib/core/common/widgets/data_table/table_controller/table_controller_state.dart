part of 'table_controller_cubit.dart';

enum TableStatus { initial, loading, loaded, failure }

@immutable
class TableControllerState extends Equatable {
  final TableStatus status;
  final String errorMessage;
  final List<ProductModel> allData;
  final List<ProductModel> filteredData;
  final bool sortAscending;
  final int sortColumnIndex;
  final List<String> selectedRows;

  const TableControllerState(
      {this.status = TableStatus.initial,
      this.errorMessage = "",
      this.allData = const [],
      this.filteredData = const [],
      this.sortAscending = true,
      this.sortColumnIndex = 0,
      this.selectedRows = const []});

  TableControllerState copyWith({
    TableStatus? status,
    String? errorMessage,
    List<ProductModel>? allData,
    bool? sortAscending,
    int? sortColumnIndex,
    List<ProductModel>? filteredData,
    List<String>? selectedRows,
  }) {
    return TableControllerState(
        errorMessage: errorMessage ?? this.errorMessage,
        allData: allData ?? this.allData,
        filteredData: filteredData ?? this.filteredData,
        status: status ?? this.status,
        sortAscending: sortAscending ?? this.sortAscending,
        sortColumnIndex: sortColumnIndex ?? this.sortColumnIndex,
        selectedRows: selectedRows ?? this.selectedRows);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        errorMessage,
        allData,
        filteredData,
        status,
        sortColumnIndex,
        sortAscending,
        selectedRows,
      ];
}
