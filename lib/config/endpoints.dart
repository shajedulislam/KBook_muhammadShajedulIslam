class MyEndpoints {
  static String books(int maxResults, int startIndex) =>
      'https://www.googleapis.com/books/v1/volumes?q=flutter development&maxResults=' +
      maxResults.toString() +
      '&startIndex=' +
      startIndex.toString();
}
