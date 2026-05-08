class OnboardingItem {
  final String image;
  final String title1;
  final String title2;
  final String description;
  final List<String>? features;

  OnboardingItem({
    required this.image,
    required this.title1,
    required this.title2,
    required this.description,
    this.features,
  });
}