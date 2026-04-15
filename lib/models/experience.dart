class ExperienceData {
  List<Experience>? experience;
  List<Projects>? projects;

  ExperienceData({this.experience, this.projects});

  ExperienceData.fromJson(Map<String, dynamic> json) {
    if (json['experience'] != null) {
      experience = <Experience>[];
      json['experience'].forEach((v) {
        experience!.add(new Experience.fromJson(v));
      });
    }
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.experience != null) {
      data['experience'] = this.experience!.map((v) => v.toJson()).toList();
    }
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Experience {
  String? name;
  String? type;
  String? company;
  String? location;
  String? startAt;
  String? endAt;

  Experience(
      {this.name,
      this.type,
      this.company,
      this.location,
      this.startAt,
      this.endAt});

  Experience.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    company = json['company'];
    location = json['location'];
    startAt = json['start_at'];
    endAt = json['end_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['company'] = this.company;
    data['location'] = this.location;
    data['start_at'] = this.startAt;
    data['end_at'] = this.endAt;
    return data;
  }
}

class Projects {
  String? title;
  String? description;
  List<String>? technologies;

  Projects({this.title, this.description, this.technologies});

  Projects.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    technologies = json['technologies'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['technologies'] = this.technologies;
    return data;
  }
}
