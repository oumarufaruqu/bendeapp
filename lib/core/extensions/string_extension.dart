extension StringExtension on String {
  String toLocaleUpperCase() {
    return replaceAll('i', 'İ')
        .replaceAll('ı', 'I')
        .replaceAll('ö', 'Ö')
        .replaceAll('ü', 'Ü')
        .replaceAll('ş', 'Ş')
        .replaceAll('ç', 'Ç')
        .replaceAll('ğ', 'Ğ')
        .toUpperCase();
  }
}
