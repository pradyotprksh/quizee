import 'package:json_annotation/json_annotation.dart';

part 'wiki_search_response.g.dart';

@JsonSerializable(explicitToJson: true)
class WikiSearchResponse {
  WikiSearchResponse({
    this.batchcomplete,
    this.wikiSearchResponseContinue,
    this.query,
  });

  factory WikiSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$WikiSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WikiSearchResponseToJson(this);

  bool batchcomplete;
  Continue wikiSearchResponseContinue;
  Queries query;

  WikiSearchResponse copyWith({
    bool batchcomplete,
    Continue wikiSearchResponseContinue,
    Queries query,
  }) =>
      WikiSearchResponse(
        batchcomplete: batchcomplete ?? this.batchcomplete,
        wikiSearchResponseContinue:
            wikiSearchResponseContinue ?? this.wikiSearchResponseContinue,
        query: query ?? this.query,
      );
}

@JsonSerializable(explicitToJson: true)
class Queries {
  Queries({
    this.redirects,
    this.pages,
  });

  factory Queries.fromJson(Map<String, dynamic> json) =>
      _$QueriesFromJson(json);

  Map<String, dynamic> toJson() => _$QueriesToJson(this);

  List<Redirect> redirects;
  List<Page> pages;

  Queries copyWith({
    List<Redirect> redirects,
    List<Page> pages,
  }) =>
      Queries(
        redirects: redirects ?? this.redirects,
        pages: pages ?? this.pages,
      );
}

@JsonSerializable(explicitToJson: true)
class Page {
  Page({
    this.pageid,
    this.ns,
    this.title,
    this.index,
    this.terms,
    this.thumbnail,
  });

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);

  int pageid;
  int ns;
  String title;
  int index;
  Terms terms;
  Thumbnail thumbnail;

  Page copyWith({
    int pageid,
    int ns,
    String title,
    int index,
    Terms terms,
    Thumbnail thumbnail,
  }) =>
      Page(
        pageid: pageid ?? this.pageid,
        ns: ns ?? this.ns,
        title: title ?? this.title,
        index: index ?? this.index,
        terms: terms ?? this.terms,
        thumbnail: thumbnail ?? this.thumbnail,
      );
}

@JsonSerializable()
class Terms {
  Terms({
    this.description,
  });

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);

  List<String> description;

  Terms copyWith({
    List<String> description,
  }) =>
      Terms(
        description: description ?? this.description,
      );
}

@JsonSerializable()
class Thumbnail {
  Thumbnail({
    this.source,
    this.width,
    this.height,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);

  String source;
  int width;
  int height;

  Thumbnail copyWith({
    String source,
    int width,
    int height,
  }) =>
      Thumbnail(
        source: source ?? this.source,
        width: width ?? this.width,
        height: height ?? this.height,
      );
}

@JsonSerializable()
class Redirect {
  Redirect({
    this.index,
    this.from,
    this.to,
    this.tofragment,
  });

  factory Redirect.fromJson(Map<String, dynamic> json) =>
      _$RedirectFromJson(json);

  Map<String, dynamic> toJson() => _$RedirectToJson(this);

  int index;
  String from;
  String to;
  String tofragment;

  Redirect copyWith({
    int index,
    String from,
    String to,
    String tofragment,
  }) =>
      Redirect(
        index: index ?? this.index,
        from: from ?? this.from,
        to: to ?? this.to,
        tofragment: tofragment ?? this.tofragment,
      );
}

@JsonSerializable()
class Continue {
  Continue({
    this.gpsoffset,
    this.continueContinue,
  });

  factory Continue.fromJson(Map<String, dynamic> json) =>
      _$ContinueFromJson(json);

  Map<String, dynamic> toJson() => _$ContinueToJson(this);

  int gpsoffset;
  String continueContinue;

  Continue copyWith({
    int gpsoffset,
    String continueContinue,
  }) =>
      Continue(
        gpsoffset: gpsoffset ?? this.gpsoffset,
        continueContinue: continueContinue ?? this.continueContinue,
      );
}
