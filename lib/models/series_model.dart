// To parse this JSON data, do
//
//     final seriesData = seriesDataFromJson(jsonString);

import 'dart:convert';

SeriesData seriesDataFromJson(String str) =>
    SeriesData.fromJson(json.decode(str));

String seriesDataToJson(SeriesData data) => json.encode(data.toJson());

class SeriesData {
  final int code;
  final String status;
  final String copyright;
  final String attributionText;
  final String attributionHtml;
  final String etag;
  final Data data;

  SeriesData({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  factory SeriesData.fromJson(Map<String, dynamic> json) => SeriesData(
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
  final String title;
  final String description;
  final String resourceUri;
  final List<Url> urls;
  final int startYear;
  final int endYear;
  final Rating rating;
  final ResultType type;
  final String modified;
  final Thumbnail thumbnail;
  final Creators creators;
  final Characters characters;
  final Stories stories;
  final Characters comics;
  final Characters events;
  final Next next;
  final Next previous;

  Result({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.urls,
    this.startYear,
    this.endYear,
    this.rating,
    this.type,
    this.modified,
    this.thumbnail,
    this.creators,
    this.characters,
    this.stories,
    this.comics,
    this.events,
    this.next,
    this.previous,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    description: json["description"] == null ? null : json["description"],
    resourceUri: json["resourceURI"],
    urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
    startYear: json["startYear"],
    endYear: json["endYear"],
    rating: ratingValues.map[json["rating"]],
    type: resultTypeValues.map[json["type"]],
    modified: json["modified"],
    thumbnail: Thumbnail.fromJson(json["thumbnail"]),
    creators: Creators.fromJson(json["creators"]),
    characters: Characters.fromJson(json["characters"]),
    stories: Stories.fromJson(json["stories"]),
    comics: Characters.fromJson(json["comics"]),
    events: Characters.fromJson(json["events"]),
    next: json["next"] == null ? null : Next.fromJson(json["next"]),
    previous:
    json["previous"] == null ? null : Next.fromJson(json["previous"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description == null ? null : description,
    "resourceURI": resourceUri,
    "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
    "startYear": startYear,
    "endYear": endYear,
    "rating": ratingValues.reverse[rating],
    "type": resultTypeValues.reverse[type],
    "modified": modified,
    "thumbnail": thumbnail.toJson(),
    "creators": creators.toJson(),
    "characters": characters.toJson(),
    "stories": stories.toJson(),
    "comics": comics.toJson(),
    "events": events.toJson(),
    "next": next == null ? null : next.toJson(),
    "previous": previous == null ? null : previous.toJson(),
  };
}

class Characters {
  final int available;
  final String collectionUri;
  final List<Next> items;
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
    items: List<Next>.from(json["items"].map((x) => Next.fromJson(x))),
    returned: json["returned"],
  );

  Map<String, dynamic> toJson() => {
    "available": available,
    "collectionURI": collectionUri,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "returned": returned,
  };
}

class Next {
  final String resourceUri;
  final String name;

  Next({
    this.resourceUri,
    this.name,
  });

  factory Next.fromJson(Map<String, dynamic> json) => Next(
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
  PENCILLER,
  COLORIST,
  WRITER,
  LETTERER,
  INKER,
  COLORIST_COVER,
  EDITOR,
  PENCILLER_COVER,
  INKER_COVER,
  PENCILER,
  ARTIST,
  OTHER,
  PENCILER_COVER,
  COMPOSER,
  MUSIC_SUPERVISOR
}

final roleValues = EnumValues({
  "artist": Role.ARTIST,
  "colorist": Role.COLORIST,
  "colorist (cover)": Role.COLORIST_COVER,
  "composer": Role.COMPOSER,
  "editor": Role.EDITOR,
  "inker": Role.INKER,
  "inker (cover)": Role.INKER_COVER,
  "letterer": Role.LETTERER,
  "music supervisor": Role.MUSIC_SUPERVISOR,
  "other": Role.OTHER,
  "penciler": Role.PENCILER,
  "penciler (cover)": Role.PENCILER_COVER,
  "penciller": Role.PENCILLER,
  "penciller (cover)": Role.PENCILLER_COVER,
  "writer": Role.WRITER
});

enum Rating { EMPTY, RATED_T, RATING_RATED_T, PURPLE_RATED_T }

final ratingValues = EnumValues({
  "": Rating.EMPTY,
  "Rated T+": Rating.PURPLE_RATED_T,
  "Rated T": Rating.RATED_T,
  "RATED T+": Rating.RATING_RATED_T
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

enum ItemType { COVER, INTERIOR_STORY, LETTERS, PINUP, EMPTY, PROMO }

final itemTypeValues = EnumValues({
  "cover": ItemType.COVER,
  "": ItemType.EMPTY,
  "interiorStory": ItemType.INTERIOR_STORY,
  "letters": ItemType.LETTERS,
  "pinup": ItemType.PINUP,
  "promo": ItemType.PROMO
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

enum ResultType { EMPTY, ONGOING, COLLECTION, LIMITED }

final resultTypeValues = EnumValues({
  "collection": ResultType.COLLECTION,
  "": ResultType.EMPTY,
  "limited": ResultType.LIMITED,
  "ongoing": ResultType.ONGOING
});

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

enum UrlType { DETAIL }

final urlTypeValues = EnumValues({"detail": UrlType.DETAIL});

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
