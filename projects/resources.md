# Resources

Here are list of lists of APIs which you can get data for your front-end projects.

If you need to sign up to get an API key, remember to follow these rules when using the key:

1. Treat the key as a secret, like you would a password
2. Don't bundle the API key with the frontend code \(it can be read by any visitor to the site!\)
3. Keep your API keys in an `.env` file in your server code
4. Add the `.env` file to `.gitignore` to prevent it from being accidentally

   committed

5. Add the API key as a config or environment variable on the server where your app is deployed

6. Here are some collections of APIs that you might find useful
   * [Data.gov (Singapore)](https://data.gov.sg/developer)
   * [https://www.quora.com/What-are-some-cool-fun-random-APIs-such-as-BreweryDB](https://www.quora.com/What-are-some-cool-fun-random-APIs-such-as-BreweryDB)
   * [https://any-api.com/](https://any-api.com/)
   * [https://github.com/toddmotto/public-apis](https://github.com/toddmotto/public-apis)
   * [https://github.com/abhishekbanthia/Public-APIs](https://github.com/abhishekbanthia/Public-APIs)
   * [https://www.computersciencezone.org/50-most-useful-apis-for-developers/](https://www.computersciencezone.org/50-most-useful-apis-for-developers/)
   * [NASA APIs](https://api.nasa.gov/)
   * [Quandl financial data](https://github.com/normanjoyner/node-quandl)

### How to get started with these Web APIs

Steps:
- Find/locate the documentation for the API (e.g. https://www.thecocktaildb.com/api.php). To find this, you may have to google around
- Read the API docs and...
  - get a general understanding of where things are in the docs
  - try to see if there are examples of URLs that you can try out
  - find the answers to the following specific questions:
    - Does the API respond in JSON format?
      - If no, it's probably time to find another API
    - Do I need an API key to make requests to the API?
      - If yes, register for an API key (you may have to fill your name, email and even application name or URL)
    - What is the base url? (e.g. https://www.thecocktaildb.com/api/json/v1/1/)
    - What are the parameters I can use? (e.g. `/cocktails`, `/cocktails/42`, `/ingredients`, `/ingredients/42`)
    - What are the query strings I can use? (e.g. `?s=margarita`, `i=vodka`, `c=Cocktail`, `apiKey=YOUR_API_KEY`)
