import 'dart:convert';

Api apiFromJson(String str) => Api.fromJson(json.decode(str));

String apiToJson(Api data) => json.encode(data.toJson());

class Api {
  late List<GeneralOption>? generalOptions;
  late List<Service> services;
  late List<ResumeOption> resumeOptions;
  late List<SocialMedia> socialMedia;
  late List<SocialMedia> aboutSocialMedia;
  late List<HeadlineKey> headlineKeys;
  late List<AboutOption> aboutOptions;
  late List<ServicesOption> servicesOption;
  late List<Education> education;
  late List<Experience> experience;
  late List<SkillOption> skillOptions;
  late List<Skill> skills;
  late List<Skill> skillsSecond;
  late List<PortfolioOption> portfolioOptions;
  late List<PortfolioCategory> portfolioCategories;
  late List<Portfolio> portfolio;
  late List<ContactOption> contactOptions;

  Api({
    required this.generalOptions,
    required this.services,
    required this.resumeOptions,
    required this.socialMedia,
    required this.aboutSocialMedia,
    required this.headlineKeys,
    required this.aboutOptions,
    required this.servicesOption,
    required this.education,
    required this.experience,
    required this.skillOptions,
    required this.skills,
    required this.skillsSecond,
    required this.portfolioOptions,
    required this.portfolioCategories,
    required this.portfolio,
    required this.contactOptions,
  });
  factory Api.fromJson(Map<String, dynamic> json) => Api(
        generalOptions: List<GeneralOption>.from(
            json["generalOptions"].map((x) => GeneralOption.fromJson(x))),
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
        resumeOptions: List<ResumeOption>.from(
            json["resumeOptions"].map((x) => ResumeOption.fromJson(x))),
        socialMedia: List<SocialMedia>.from(
            json["socialMedia"].map((x) => SocialMedia.fromJson(x))),
        aboutSocialMedia: List<SocialMedia>.from(
            json["aboutSocialMedia"].map((x) => SocialMedia.fromJson(x))),
        headlineKeys: List<HeadlineKey>.from(
            json["headlineKeys"].map((x) => HeadlineKey.fromJson(x))),
        aboutOptions: List<AboutOption>.from(
            json["aboutOptions"].map((x) => AboutOption.fromJson(x))),
        servicesOption: List<ServicesOption>.from(
            json["servicesOption"].map((x) => ServicesOption.fromJson(x))),
        education: List<Education>.from(
            json["education"].map((x) => Education.fromJson(x))),
        experience: List<Experience>.from(
            json["experience"].map((x) => Experience.fromJson(x))),
        skillOptions: List<SkillOption>.from(
            json["skillOptions"].map((x) => SkillOption.fromJson(x))),
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        skillsSecond: List<Skill>.from(
            json["skillsSecond"].map((x) => Skill.fromJson(x))),
        portfolioOptions: List<PortfolioOption>.from(
            json["portfolioOptions"].map((x) => PortfolioOption.fromJson(x))),
        portfolioCategories: List<PortfolioCategory>.from(
            json["portfolioCategories"]
                .map((x) => PortfolioCategory.fromJson(x))),
        portfolio: List<Portfolio>.from(
            json["portfolio"].map((x) => Portfolio.fromJson(x))),
        contactOptions: List<ContactOption>.from(
            json["contactOptions"].map((x) => ContactOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "generalOptions":
            List<dynamic>.from(generalOptions!.map((x) => x.toJson())),
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
        "resumeOptions":
            List<dynamic>.from(resumeOptions.map((x) => x.toJson())),
        "socialMedia": List<dynamic>.from(socialMedia.map((x) => x.toJson())),
        "aboutSocialMedia":
            List<dynamic>.from(aboutSocialMedia.map((x) => x.toJson())),
        "headlineKeys": List<dynamic>.from(headlineKeys.map((x) => x.toJson())),
        "aboutOptions": List<dynamic>.from(aboutOptions.map((x) => x.toJson())),
        "servicesOption":
            List<dynamic>.from(servicesOption.map((x) => x.toJson())),
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
        "experience": List<dynamic>.from(experience.map((x) => x.toJson())),
        "skillOptions": List<dynamic>.from(skillOptions.map((x) => x.toJson())),
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "skillsSecond": List<dynamic>.from(skillsSecond.map((x) => x.toJson())),
        "portfolioOptions":
            List<dynamic>.from(portfolioOptions.map((x) => x.toJson())),
        "portfolioCategories":
            List<dynamic>.from(portfolioCategories.map((x) => x.toJson())),
        "portfolio": List<dynamic>.from(portfolio.map((x) => x.toJson())),
        "contactOptions":
            List<dynamic>.from(contactOptions.map((x) => x.toJson())),
      };
}

class AboutOption {
  AboutOption({
    required this.aboutId,
    required this.aboutName,
    required this.aboutValue,
  });

  String aboutId;
  String aboutName;
  String aboutValue;

  factory AboutOption.fromJson(Map<String, dynamic> json) => AboutOption(
        aboutId: json["about_id"],
        aboutName: json["about_name"],
        aboutValue: json["about_value"],
      );

  Map<String, dynamic> toJson() => {
        "about_id": aboutId,
        "about_name": aboutName,
        "about_value": aboutValue,
      };
}

class SocialMedia {
  SocialMedia({
    required this.socialMediaId,
    required this.url,
    required this.icon,
  });

  String socialMediaId;
  String url;
  String icon;

  factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
        socialMediaId: json["social_media_id"],
        url: json["url"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "social_media_id": socialMediaId,
        "url": url,
        "icon": icon,
      };
}

class ContactOption {
  ContactOption({
    required this.contactId,
    required this.contactName,
    required this.contactValue,
  });

  String contactId;
  String contactName;
  String contactValue;

  factory ContactOption.fromJson(Map<String, dynamic> json) => ContactOption(
        contactId: json["contact_id"],
        contactName: json["contact_name"],
        contactValue: json["contact_value"],
      );

  Map<String, dynamic> toJson() => {
        "contact_id": contactId,
        "contact_name": contactName,
        "contact_value": contactValue,
      };
}

class Education {
  Education({
    required this.educationId,
    required this.educationTitle,
    required this.educationDetails,
  });

  String educationId;
  String educationTitle;
  String educationDetails;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        educationId: json["education_id"],
        educationTitle: json["education_title"],
        educationDetails: json["education_details"],
      );

  Map<String, dynamic> toJson() => {
        "education_id": educationId,
        "education_title": educationTitle,
        "education_details": educationDetails,
      };
}

class Experience {
  Experience({
    required this.experienceId,
    required this.experienceTitle,
    required this.experienceDetails,
  });

  String experienceId;
  String experienceTitle;
  String experienceDetails;

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        experienceId: json["experience_id"],
        experienceTitle: json["experience_title"],
        experienceDetails: json["experience_details"],
      );

  Map<String, dynamic> toJson() => {
        "experience_id": experienceId,
        "experience_title": experienceTitle,
        "experience_details": experienceDetails,
      };
}

class GeneralOption {
  GeneralOption({
    required this.optionId,
    required this.optionName,
    required this.optionValue,
  });

  String optionId;
  String optionName;
  String optionValue;

  factory GeneralOption.fromJson(Map<String, dynamic> json) => GeneralOption(
        optionId: json["option_id"],
        optionName: json["option_name"],
        optionValue: json["option_value"],
      );

  Map<String, dynamic> toJson() => {
        "option_id": optionId,
        "option_name": optionName,
        "option_value": optionValue,
      };
}

class HeadlineKey {
  HeadlineKey({
    required this.keyId,
    required this.keyValue,
  });

  String keyId;
  String keyValue;

  factory HeadlineKey.fromJson(Map<String, dynamic> json) => HeadlineKey(
        keyId: json["key_id"],
        keyValue: json["key_value"],
      );

  Map<String, dynamic> toJson() => {
        "key_id": keyId,
        "key_value": keyValue,
      };
}

class Portfolio {
  Portfolio({
    required this.portfolioId,
    required this.portfolioTitle,
    required this.portfolioContent,
    required this.portfolioImage,
    required this.portfolioUrl,
    required this.portfolioCategory,
    required this.categoryId,
    required this.categoryName,
    required this.categoryFilterCode,
  });

  String portfolioId;
  String portfolioTitle;
  String portfolioContent;
  String portfolioImage;
  String portfolioUrl;
  String portfolioCategory;
  String categoryId;
  String categoryName;
  String categoryFilterCode;

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        portfolioId: json["portfolio_id"],
        portfolioTitle: json["portfolio_title"],
        portfolioContent: json["portfolio_content"],
        portfolioImage: json["portfolio_image"],
        portfolioUrl: json["portfolio_url"],
        portfolioCategory: json["portfolio_category"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryFilterCode: json["category_filter_code"],
      );

  Map<String, dynamic> toJson() => {
        "portfolio_id": portfolioId,
        "portfolio_title": portfolioTitle,
        "portfolio_content": portfolioContent,
        "portfolio_image": portfolioImage,
        "portfolio_url": portfolioUrl,
        "portfolio_category": portfolioCategory,
        "category_id": categoryId,
        "category_name": categoryName,
        "category_filter_code": categoryFilterCode,
      };
}

class PortfolioCategory {
  PortfolioCategory({
    required this.categoryId,
    required this.categoryName,
    required this.categoryFilterCode,
  });

  String categoryId;
  String categoryName;
  String categoryFilterCode;

  factory PortfolioCategory.fromJson(Map<String, dynamic> json) =>
      PortfolioCategory(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryFilterCode: json["category_filter_code"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_filter_code": categoryFilterCode,
      };
}

class PortfolioOption {
  PortfolioOption({
    required this.portfolioId,
    required this.portfolioName,
    required this.portfolioValue,
  });

  String portfolioId;
  String portfolioName;
  String portfolioValue;

  factory PortfolioOption.fromJson(Map<String, dynamic> json) =>
      PortfolioOption(
        portfolioId: json["portfolio_id"],
        portfolioName: json["portfolio_name"],
        portfolioValue: json["portfolio_value"],
      );

  Map<String, dynamic> toJson() => {
        "portfolio_id": portfolioId,
        "portfolio_name": portfolioName,
        "portfolio_value": portfolioValue,
      };
}

class ResumeOption {
  ResumeOption({
    required this.resumeId,
    required this.resumeName,
    required this.resumeValue,
  });

  String resumeId;
  String resumeName;
  String resumeValue;

  factory ResumeOption.fromJson(Map<String, dynamic> json) => ResumeOption(
        resumeId: json["resume_id"],
        resumeName: json["resume_name"],
        resumeValue: json["resume_value"],
      );

  Map<String, dynamic> toJson() => {
        "resume_id": resumeId,
        "resume_name": resumeName,
        "resume_value": resumeValue,
      };
}

class Service {
  Service({
    required this.serviceId,
    required this.serviceName,
    required this.serviceDescription,
    required this.serviceIcon,
  });

  String serviceId;
  String serviceName;
  String serviceDescription;
  String serviceIcon;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceId: json["service_id"],
        serviceName: json["service_name"],
        serviceDescription: json["service_description"],
        serviceIcon: json["service_icon"],
      );

  Map<String, dynamic> toJson() => {
        "service_id": serviceId,
        "service_name": serviceName,
        "service_description": serviceDescription,
        "service_icon": serviceIcon,
      };
}

class ServicesOption {
  ServicesOption({
    required this.serviceId,
    required this.serviceName,
    required this.serviceValue,
  });

  String serviceId;
  String serviceName;
  String serviceValue;

  factory ServicesOption.fromJson(Map<String, dynamic> json) => ServicesOption(
        serviceId: json["service_id"],
        serviceName: json["service_name"],
        serviceValue: json["service_value"],
      );

  Map<String, dynamic> toJson() => {
        "service_id": serviceId,
        "service_name": serviceName,
        "service_value": serviceValue,
      };
}

class SkillOption {
  SkillOption({
    required this.skillId,
    required this.skillName,
    required this.skillValue,
  });

  String skillId;
  String skillName;
  String skillValue;

  factory SkillOption.fromJson(Map<String, dynamic> json) => SkillOption(
        skillId: json["skill_id"],
        skillName: json["skill_name"],
        skillValue: json["skill_value"],
      );

  Map<String, dynamic> toJson() => {
        "skill_id": skillId,
        "skill_name": skillName,
        "skill_value": skillValue,
      };
}

class Skill {
  Skill({
    required this.skillInfoId,
    required this.skillInfoName,
    required this.skillInfoPercantage,
  });

  String skillInfoId;
  String skillInfoName;
  String skillInfoPercantage;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        skillInfoId: json["skill_info_id"],
        skillInfoName: json["skill_info_name"],
        skillInfoPercantage: json["skill_info_percantage"],
      );

  Map<String, dynamic> toJson() => {
        "skill_info_id": skillInfoId,
        "skill_info_name": skillInfoName,
        "skill_info_percantage": skillInfoPercantage,
      };
}
