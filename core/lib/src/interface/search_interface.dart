import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

/// A search interface which helps in performing UI logic in the Search view.
class SearchInterface extends GetxController {
  var query = ''.obs;
  BuildContext buildContext = Get.context;

  @override
  void onInit() {
    super.onInit();
    debounce<String>(
      query,
      (value) {
        buildContext.read<SearchBloc>().add(
              SearchQueryChange(
                query: value,
              ),
            );
      },
      time: const Duration(
        milliseconds: 500,
      ),
    );
  }
}
