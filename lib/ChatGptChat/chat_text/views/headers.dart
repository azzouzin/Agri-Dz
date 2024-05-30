const String OPEN_AI_KEY =
    "sk-proj-GdXKvEicva8l7jGpi1TkT3BlbkFJlXH3La2XNPslqYpL4eGO";

const String baseURL = "https://api.openai.com/v1";

String endPoint(String endPoint) => "$baseURL/$endPoint";

Map<String, String> headerBearerOption(String token) => {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };

enum ApiState { loading, success, error, notFound }
