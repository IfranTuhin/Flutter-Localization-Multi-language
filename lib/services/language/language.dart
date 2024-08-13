class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return [
      Language(1, '🇺🇸', 'English', 'en'),
      Language(3, '🇧🇩', 'বাংলা', 'bn'),
      Language(2, '🇮🇳', 'हिन्दी', 'hi'),
      Language(4, "🇸🇦", "اَلْعَرَبِيَّةُ", "ar"),
      // Add more languages here...
    ];
  }
}