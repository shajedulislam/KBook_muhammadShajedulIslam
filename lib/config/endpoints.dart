class MyEndpoints {
  static String books(String maxResults, String startIndex) =>
      'https://www.googleapis.com/books/v1/volumes?q=flutter&maxResults=' +
      maxResults +
      '&startIndex=' +
      startIndex;
}
