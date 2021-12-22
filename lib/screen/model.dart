class Model {
  List<Results> results = <Results>[];
  late Info info;

  Model({required this.results, required this.info});

  Model.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
    info = (json['info'] != null ? Info.fromJson(json['info']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results.map((v) => v.toJson()).toList();
    data['info'] = info.toJson();
    return data;
  }
}

class Results {
  late String gender;
  late Name name;
  late Location location;
  late String email;
  late Login login;
  late Dob dob;
  late Dob registered;
  late String phone;
  late String cell;
  late Id id;
  late Picture picture;
  late String nat;

  Results(
      {required this.gender,
        required this.name,
        required this.location,
        required this.email,
        required this.login,
        required this.dob,
        required this.registered,
        required this.phone,
        required this.cell,
        required this.id,
        required this.picture,
        required this.nat});

  Results.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    name = (json['name'] != null ? Name.fromJson(json['name']) : null)!;
    location = (json['location'] != null
        ? Location.fromJson(json['location'])
        : null)!;
    email = json['email'];
    login = (json['login'] != null ? Login.fromJson(json['login']) : null)!;
    dob = (json['dob'] != null ? Dob.fromJson(json['dob']) : null)!;
    registered = (json['registered'] != null
        ? Dob.fromJson(json['registered'])
        : null)!;
    phone = json['phone'];
    cell = json['cell'];
    id = (json['id'] != null ? Id.fromJson(json['id']) : null)!;
    picture =
    (json['picture'] != null ? Picture.fromJson(json['picture']) : null)!;
    nat = json['nat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['email'] = this.email;
    if (this.login != null) {
      data['login'] = this.login.toJson();
    }
    if (this.dob != null) {
      data['dob'] = this.dob.toJson();
    }
    if (this.registered != null) {
      data['registered'] = this.registered.toJson();
    }
    data['phone'] = this.phone;
    data['cell'] = this.cell;
    if (this.id != null) {
      data['id'] = this.id.toJson();
    }
    if (this.picture != null) {
      data['picture'] = this.picture.toJson();
    }
    data['nat'] = this.nat;
    return data;
  }
}

class Name {
  late String title;
  late String first;
  late String last;

  Name({required this.title, required this.first, required this.last});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['first'] = first;
    data['last'] = last;
    return data;
  }
}

class Location {
  late Street street;
  late String city;
  late String state;
  late String country;
  late int postcode;
  late Coordinates coordinates;
  late Timezone timezone;

  Location(
      {required this.street,
        required this.city,
        required this.state,
        required this.country,
        required this.postcode,
        required this.coordinates,
        required this.timezone});

  Location.fromJson(Map<String, dynamic> json) {
    street =
    (json['street'] != null ? Street.fromJson(json['street']) : null)!;
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postcode = json['postcode'];
    coordinates = (json['coordinates'] != null
        ? Coordinates.fromJson(json['coordinates'])
        : null)!;
    timezone = (json['timezone'] != null
        ? Timezone.fromJson(json['timezone'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.street != null) {
      data['street'] = this.street.toJson();
    }
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['postcode'] = this.postcode;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates.toJson();
    }
    if (this.timezone != null) {
      data['timezone'] = this.timezone.toJson();
    }
    return data;
  }
}

class Street {
  late int number;
  late String name;

  Street({required this.number, required this.name});

  Street.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['name'] = this.name;
    return data;
  }
}

class Coordinates {
  late String latitude;
  late String longitude;

  Coordinates({required this.latitude, required this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Timezone {
  late String offset;
  late String description;

  Timezone({required this.offset, required this.description});

  Timezone.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['description'] = this.description;
    return data;
  }
}

class Login {
  late String uuid;
  late String username;
  late String password;
  late String salt;
  late String md5;
  late String sha1;
  late String sha256;

  Login(
      {required this.uuid,
        required this.username,
        required this.password,
        required this.salt,
        required this.md5,
        required this.sha1,
        required this.sha256});

  Login.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    username = json['username'];
    password = json['password'];
    salt = json['salt'];
    md5 = json['md5'];
    sha1 = json['sha1'];
    sha256 = json['sha256'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['username'] = this.username;
    data['password'] = this.password;
    data['salt'] = this.salt;
    data['md5'] = this.md5;
    data['sha1'] = this.sha1;
    data['sha256'] = this.sha256;
    return data;
  }
}

class Dob {
  late String date;
  late int age;

  Dob({required this.date, required this.age});

  Dob.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['age'] = this.age;
    return data;
  }
}

class Id {
  late String name;
  late String value;

  Id({required this.name, required this.value});

  Id.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class Picture {
  late String large;
  late String medium;
  late String thumbnail;

  Picture({required this.large, required this.medium, required this.thumbnail});

  Picture.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    medium = json['medium'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['medium'] = this.medium;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Info {
  late String seed;
  late int results;
  late int page;
  late String version;

  Info({required this.seed, required this.results, required this.page, required this.version});

  Info.fromJson(Map<String, dynamic> json) {
    seed = json['seed'];
    results = json['results'];
    page = json['page'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seed'] = this.seed;
    data['results'] = this.results;
    data['page'] = this.page;
    data['version'] = this.version;
    return data;
  }
}