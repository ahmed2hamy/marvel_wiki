// To parse this JSON data, do
//
//     final comicsData = comicsDataFromJson(jsonString);

import 'dart:convert';

ComicsData comicsDataFromJson(String str) =>
    ComicsData.fromJson(json.decode(str));

String comicsDataToJson(ComicsData data) => json.encode(data.toJson());

class ComicsData {
  final int code;
  final String status;
  final String copyright;
  final String attributionText;
  final String attributionHtml;
  final String etag;
  final Data data;

  ComicsData({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  factory ComicsData.fromJson(Map<String, dynamic> json) => ComicsData(
    code: json["code"],
    status: json["status"],
    copyright: json["copyright"],
    attributionText: json["attributionText"],
    attributionHtml: json["attributionHTML"],
    etag: json["etag"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "copyright": copyright,
    "attributionText": attributionText,
    "attributionHTML": attributionHtml,
    "etag": etag,
    "data": data.toJson(),
  };
}

class Data {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<Result> results;

  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    offset: json["offset"],
    limit: json["limit"],
    total: json["total"],
    count: json["count"],
    results:
    List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "limit": limit,
    "total": total,
    "count": count,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  final int id;
  final int digitalId;
  final String title;
  final int issueNumber;
  final String variantDescription;
  final String description;
  final String modified;
  final String isbn;
  final String upc;
  final String diamondCode;
  final String ean;
  final Issn issn;
  final Format format;
  final int pageCount;
  final List<TextObject> textObjects;
  final String resourceUri;
  final List<Url> urls;
  final Series series;
  final List<dynamic> variants;
  final List<dynamic> collections;
  final List<dynamic> collectedIssues;
  final List<Date> dates;
  final List<Price> prices;
  final Thumbnail thumbnail;
  final List<Thumbnail> images;
  final Creators creators;
  final Characters characters;
  final Stories stories;
  final Characters events;

  Result({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    digitalId: json["digitalId"],
    title: json["title"],
    issueNumber: json["issueNumber"],
    variantDescription: json["variantDescription"],
    description: json["description"] == null ? null : json["description"],
    modified: json["modified"],
    isbn: json["isbn"],
    upc: json["upc"],
    diamondCode: json["diamondCode"],
    ean: json["ean"],
    issn: issnValues.map[json["issn"]],
    format: formatValues.map[json["format"]],
    pageCount: json["pageCount"],
    textObjects: List<TextObject>.from(
        json["textObjects"].map((x) => TextObject.fromJson(x))),
    resourceUri: json["resourceURI"],
    urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
    series: Series.fromJson(json["series"]),
    variants: List<dynamic>.from(json["variants"].map((x) => x)),
    collections: List<dynamic>.from(json["collections"].map((x) => x)),
    collectedIssues:
    List<dynamic>.from(json["collectedIssues"].map((x) => x)),
    dates: List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
    prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
    thumbnail: Thumbnail.fromJson(json["thumbnail"]),
    images: List<Thumbnail>.from(
        json["images"].map((x) => Thumbnail.fromJson(x))),
    creators: Creators.fromJson(json["creators"]),
    characters: Characters.fromJson(json["characters"]),
    stories: Stories.fromJson(json["stories"]),
    events: Characters.fromJson(json["events"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "digitalId": digitalId,
    "title": title,
    "issueNumber": issueNumber,
    "variantDescription": variantDescription,
    "description": description == null ? null : description,
    "modified": modified,
    "isbn": isbn,
    "upc": upc,
    "diamondCode": diamondCode,
    "ean": ean,
    "issn": issnValues.reverse[issn],
    "format": formatValues.reverse[format],
    "pageCount": pageCount,
    "textObjects": List<dynamic>.from(textObjects.map((x) => x.toJson())),
    "resourceURI": resourceUri,
    "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
    "series": series.toJson(),
    "variants": List<dynamic>.from(variants.map((x) => x)),
    "collections": List<dynamic>.from(collections.map((x) => x)),
    "collectedIssues": List<dynamic>.from(collectedIssues.map((x) => x)),
    "dates": List<dynamic>.from(dates.map((x) => x.toJson())),
    "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
    "thumbnail": thumbnail.toJson(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "creators": creators.toJson(),
    "characters": characters.toJson(),
    "stories": stories.toJson(),
    "events": events.toJson(),
  };
}

class Characters {
  final int available;
  final String collectionUri;
  final List<Series> items;
  final int returned;

  Characters({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
    available: json["available"],
    collectionUri: json["collectionURI"],
    items: List<Series>.from(json["items"].map((x) => Series.fromJson(x))),
    returned: json["returned"],
  );

  Map<String, dynamic> toJson() => {
    "available": available,
    "collectionURI": collectionUri,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "returned": returned,
  };
}

class Series {
  final String resourceUri;
  final String name;

  Series({
    this.resourceUri,
    this.name,
  });

  factory Series.fromJson(Map<String, dynamic> json) => Series(
    resourceUri: json["resourceURI"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri,
    "name": name,
  };
}

class Creators {
  final int available;
  final String collectionUri;
  final List<CreatorsItem> items;
  final int returned;

  Creators({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Creators.fromJson(Map<String, dynamic> json) => Creators(
    available: json["available"],
    collectionUri: json["collectionURI"],
    items: List<CreatorsItem>.from(
        json["items"].map((x) => CreatorsItem.fromJson(x))),
    returned: json["returned"],
  );

  Map<String, dynamic> toJson() => {
    "available": available,
    "collectionURI": collectionUri,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "returned": returned,
  };
}

class CreatorsItem {
  final String resourceUri;
  final String name;
  final Role role;

  CreatorsItem({
    this.resourceUri,
    this.name,
    this.role,
  });

  factory CreatorsItem.fromJson(Map<String, dynamic> json) => CreatorsItem(
    resourceUri: json["resourceURI"],
    name: json["name"],
    role: roleValues.map[json["role"]],
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri,
    "name": name,
    "role": roleValues.reverse[role],
  };
}

enum Role {
  EDITOR,
  WRITER,
  COLORIST,
  PENCILER,
  LETTERER,
  PENCILLER_COVER,
  PENCILLER,
  COLORIST_COVER,
  INKER,
  PENCILER_COVER,
  ARTIST
}

final roleValues = EnumValues({
  "artist": Role.ARTIST,
  "colorist": Role.COLORIST,
  "colorist (cover)": Role.COLORIST_COVER,
  "editor": Role.EDITOR,
  "inker": Role.INKER,
  "letterer": Role.LETTERER,
  "penciler": Role.PENCILER,
  "penciler (cover)": Role.PENCILER_COVER,
  "penciller": Role.PENCILLER,
  "penciller (cover)": Role.PENCILLER_COVER,
  "writer": Role.WRITER
});

class Date {
  final DateType type;
  final String date;

  Date({
    this.type,
    this.date,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    type: dateTypeValues.map[json["type"]],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "type": dateTypeValues.reverse[type],
    "date": date,
  };
}

enum DateType { ONSALE_DATE, FOC_DATE, UNLIMITED_DATE, DIGITAL_PURCHASE_DATE }

final dateTypeValues = EnumValues({
  "digitalPurchaseDate": DateType.DIGITAL_PURCHASE_DATE,
  "focDate": DateType.FOC_DATE,
  "onsaleDate": DateType.ONSALE_DATE,
  "unlimitedDate": DateType.UNLIMITED_DATE
});

enum Format { COMIC, TRADE_PAPERBACK, HARDCOVER }

final formatValues = EnumValues({
  "Comic": Format.COMIC,
  "Hardcover": Format.HARDCOVER,
  "Trade Paperback": Format.TRADE_PAPERBACK
});

class Thumbnail {
  final String path;
  final String extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
    path: json["path"],
    extension: json["extension"],
  );

  Map<String, dynamic> toJson() => {
    "path": path,
    "extension": extension,
  };
}

enum Issn { EMPTY, THE_2328482_X }

final issnValues =
EnumValues({"": Issn.EMPTY, "2328-482X": Issn.THE_2328482_X});

class Price {
  final PriceType type;
  final double price;

  Price({
    this.type,
    this.price,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    type: priceTypeValues.map[json["type"]],
    price: json["price"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "type": priceTypeValues.reverse[type],
    "price": price,
  };
}

enum PriceType { PRINT_PRICE, DIGITAL_PURCHASE_PRICE }

final priceTypeValues = EnumValues({
  "digitalPurchasePrice": PriceType.DIGITAL_PURCHASE_PRICE,
  "printPrice": PriceType.PRINT_PRICE
});

class Stories {
  final int available;
  final String collectionUri;
  final List<StoriesItem> items;
  final int returned;

  Stories({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
    available: json["available"],
    collectionUri: json["collectionURI"],
    items: List<StoriesItem>.from(
        json["items"].map((x) => StoriesItem.fromJson(x))),
    returned: json["returned"],
  );

  Map<String, dynamic> toJson() => {
    "available": available,
    "collectionURI": collectionUri,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "returned": returned,
  };
}

class StoriesItem {
  final String resourceUri;
  final String name;
  final ItemType type;

  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
    resourceUri: json["resourceURI"],
    name: json["name"],
    type: itemTypeValues.map[json["type"]],
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri,
    "name": name,
    "type": itemTypeValues.reverse[type],
  };
}

enum ItemType { COVER, INTERIOR_STORY, LETTERS }

final itemTypeValues = EnumValues({
  "cover": ItemType.COVER,
  "interiorStory": ItemType.INTERIOR_STORY,
  "letters": ItemType.LETTERS
});

class TextObject {
  final TextObjectType type;
  final Language language;
  final String text;

  TextObject({
    this.type,
    this.language,
    this.text,
  });

  factory TextObject.fromJson(Map<String, dynamic> json) => TextObject(
    type: textObjectTypeValues.map[json["type"]],
    language: languageValues.map[json["language"]],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "type": textObjectTypeValues.reverse[type],
    "language": languageValues.reverse[language],
    "text": text,
  };
}

enum Language { EN_US }

final languageValues = EnumValues({"en-us": Language.EN_US});

enum TextObjectType { ISSUE_SOLICIT_TEXT }

final textObjectTypeValues =
EnumValues({"issue_solicit_text": TextObjectType.ISSUE_SOLICIT_TEXT});

class Url {
  final UrlType type;
  final String url;

  Url({
    this.type,
    this.url,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
    type: urlTypeValues.map[json["type"]],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "type": urlTypeValues.reverse[type],
    "url": url,
  };
}

enum UrlType { DETAIL, PURCHASE, READER, IN_APP_LINK }

final urlTypeValues = EnumValues({
  "detail": UrlType.DETAIL,
  "inAppLink": UrlType.IN_APP_LINK,
  "purchase": UrlType.PURCHASE,
  "reader": UrlType.READER
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
