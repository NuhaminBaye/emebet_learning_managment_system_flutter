class FileUtils {
  static bool isImage(String fileName) {
    return fileName.endsWith(".png") ||
           fileName.endsWith(".jpg") ||
           fileName.endsWith(".jpeg");
  }
}