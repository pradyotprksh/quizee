import 'package:WikiSearch/src/views/ui/search_screen/widget/widget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

/// A search screen which will handle all the ui realted work.
class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocListener<SearchBloc, SearchState>(
    listener: (_, state) {
      if (state.searchStatus == SearchStatus.error) {
        Utility.showError(state.errorMessage);
      }
    },
    child: Scaffold(
      extendBody: true,
          backgroundColor: Get.theme.backgroundColor,
          floatingActionButton: HistoryButton(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: SearchFormField(),
          ),
          body: SearchBody(),
        ),
  );
}
