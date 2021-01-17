import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

/// A form field which will handle any change in the search field.
class SearchFormField extends StatelessWidget {
  final SearchInterface _searchInterface = Get.find();

  @override
  Widget build(BuildContext context) => TextFormField(
        initialValue: '',
        style: Styles.black18,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          filled: true,
          hintStyle: Styles.black18,
          hintText: StringConstants.search,
          fillColor: Colors.white70,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        onChanged: (value) {
          _searchInterface.buildContext = context;
          _searchInterface.query.value = value;
        },
      );
}
