// To parse this JSON data, do
//
//     final eventsData = eventsDataFromJson(jsonString);

import 'dart:convert';

EventsData eventsDataFromJson(String str) =>
    EventsData.fromJson(json.decode(str));

String eventsDataToJson(EventsData data) => json.encode(data.toJson());

class EventsData {
  final int code;
  final String status;
  final String copyright;
  final String attributionText;
  final String attributionHtml;
  final String etag;
  final Data data;

  EventsData({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  factory EventsData.fromJson(Map<String, dynamic> json) => EventsData(
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
  final String modified;
  final DateTime start;
  final DateTime end;
  final Thumbnail thumbnail;
  final Creators creators;
  final Characters characters;
  final Stories stories;
  final Characters comics;
  final Characters series;
  final Next next;
  final Next previous;

  Result({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.urls,
    this.modified,
    this.start,
    this.end,
    this.thumbnail,
    this.creators,
    this.characters,
    this.stories,
    this.comics,
    this.series,
    this.next,
    this.previous,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    resourceUri: json["resourceURI"],
    urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
    modified: json["modified"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
    thumbnail: Thumbnail.fromJson(json["thumbnail"]),
    creators: Creators.fromJson(json["creators"]),
    characters: Characters.fromJson(json["characters"]),
    stories: Stories.fromJson(json["stories"]),
    comics: Characters.fromJson(json["comics"]),
    series: Characters.fromJson(json["series"]),
    next: Next.fromJson(json["next"]),
    previous: Next.fromJson(json["previous"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "resourceURI": resourceUri,
    "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
    "modified": modified,
    "start": start.toIso8601String(),
    "end": end.toIso8601String(),
    "thumbnail": thumbnail.toJson(),
    "creators": creators.toJson(),
    "characters": characters.toJson(),
    "stories": stories.toJson(),
    "comics": comics.toJson(),
    "series": series.toJson(),
    "next": next.toJson(),
    "previous": previous.toJson(),
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

  factory Next.fromJson(Map<String, dynamic> json) =>
      Next(
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
  final String role;

  CreatorsItem({
    this.resourceUri,
    this.name,
    this.role,
  });

  factory CreatorsItem.fromJson(Map<String, dynamic> json) => CreatorsItem(
    resourceUri: json["resourceURI"],
    name: json["name"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri,
    "name": name,
    "role": role,
  };
}

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
  final Type type;

  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
    resourceUri: json["resourceURI"],
    name: json["name"],
    type: typeValues.map[json["type"]],
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri,
    "name": name,
    "type": typeValues.reverse[type],
  };
}

enum Type { EMPTY, INTERIOR_STORY, COVER, TEXT_STORY }

final typeValues = EnumValues({
  "cover": Type.COVER,
  "": Type.EMPTY,
  "interiorStory": Type.INTERIOR_STORY,
  "text story": Type.TEXT_STORY
});

class Thumbnail {
  final String path;
  final String extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toJson() => {
    "path": path,
    "extension": extension,
  };
}

class Url {
  final String type;
  final String url;

  Url({
    this.type,
    this.url,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
    type: json["type"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "url": url,
  };
}

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
