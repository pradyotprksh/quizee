import 'package:WikiSearch/src/views/ui/search_screen/widget/widget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

/// The main search body which contains all the widgets for the screen.
class SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<SearchBloc, SearchState>(
        builder: (_, state) => Stack(
          children: [
            (state.wikiSearchResponse?.query?.pages?.length ?? 0) > 0
                ? ListView.builder(
                    padding: Dimens.margin0_10_0_0,
                    shrinkWrap: true,
                    itemCount:
                        state.wikiSearchResponse?.query?.pages?.length ?? 0,
                    itemBuilder: (_, position) {
                      var singlePage =
                          state.wikiSearchResponse.query.pages[position];
                      return SingleSearchedItem(
                        singlePage.title ?? '',
                        singlePage.thumbnail?.source ?? '',
                        _getDescription(singlePage.terms),
                      );
                    },
                  )
                : EmptyUiWidget(),
            if (state.searchStatus == SearchStatus.loading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      );

  String _getDescription(Terms terms) {
    if (terms == null ||
        terms.description == null ||
        terms.description.isEmpty) {
      return '';
    }
    return terms.description.first;
  }
}
