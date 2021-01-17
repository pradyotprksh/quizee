import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// A single search item widget.
class SingleSearchedItem extends StatelessWidget {
  SingleSearchedItem(this.title, this.thumbnail, this.description);

  final String title;
  final String thumbnail;
  final String description;

  @override
  Widget build(BuildContext context) => Card(
        margin: Dimens.padding5,
        child: ListTile(
          onTap: () {
            Utility.openUrl(title);
          },
          leading: thumbnail.isNotEmpty
              ? Image.network(
                  thumbnail,
                  width: Dimens.fifty,
                  height: Dimens.fifty,
                )
              : Image.asset(
                  AssetsConstants.defaultLogo,
                  width: Dimens.fifty,
                  height: Dimens.fifty,
                ),
          title: Text(
            title,
            style: Styles.black18,
          ),
          subtitle: Text(
            description,
          ),
        ),
      );
}
