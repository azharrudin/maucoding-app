class Language {
  final String name;
  final String code;

  const Language({required this.name, required this.code});
}

List<Language> Languages = [
  Language(name: 'English', code: 'en'),
  Language(name: 'हिन्दी', code: 'hi'),
  Language(name: 'తెలుగు', code: 'te')
];

var LangCodePair = {'en': 'English', 'hi': 'हिन्दी', 'te': 'తెలుగు'};
