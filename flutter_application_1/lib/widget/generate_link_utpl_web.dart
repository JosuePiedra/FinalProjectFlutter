String generateNewsLink(String title) {
  // Convertir el título a minúsculas
  String lowercaseTitle = title.toLowerCase();

  // Reemplazar espacios por guiones
  String hyphenatedTitle = lowercaseTitle.replaceAll(' ', '-');

  // Ignorar comillas, comas y puntos
  hyphenatedTitle = hyphenatedTitle
      .replaceAll('"', '')
      .replaceAll(',', '')
      .replaceAll('.', '');

  // Eliminar espacios al final
  hyphenatedTitle = hyphenatedTitle.trim();

  // Combinar con la URL base del sitio de noticias
  String newsLink = 'https://noticias.utpl.edu.ec/$hyphenatedTitle';

  return newsLink;
}
