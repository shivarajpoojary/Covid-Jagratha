class OnboardingModel {
  String image;
  String text;
  String title;

  OnboardingModel({this.image, this.text, this.title});
  static List<OnboardingModel> list = [
    OnboardingModel(
        image: "images/one.png",
        title: "Wash Hand",
        text:
            "Practice good personal hygiene. Wash your hands before you eat. Be aware of good clean water and food sources."),
    OnboardingModel(
        image: "images/two.png",
        title: "Social Distance ",
        text:
            "Nothing in life is to be feared, it is only to be understood. Now is the time to understand more, so that we may fear less"),
    OnboardingModel(
        image: "images/three.png",
        title: "Corona Warriors",
        text:
            "Gratitude makes sense of our past, brings peace for today, and creates a vision for tomorrow")
  ];
}
