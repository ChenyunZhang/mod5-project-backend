require 'net/http'
require 'openssl'
require 'json'
require 'uri'


genre=["Art",
    "Biography",
    "Business",
    "Chick Lit",
    "Children's",
    "Christian",
    "Classics",
    "Comics",
    "Contemporary",
    "Cookbooks",
    "Crime",
    "Ebooks",
    "Fantasy",
    "Fiction",
    "Gay and Lesbian",
    "Graphic Novels",
    "Historical Fiction",
    "History",
    "Horror",
    "Humor and Comedy",
    "Manga",
    "Memoir",
    "Music",
    "Mystery",
    "Nonfiction",
    "Paranormal",
    "Philosophy",
    "Poetry",
    "Psychology",
    "Religion",
    "Romance",
    "Science",
    "Science Fiction",
    "Self Help",
    "Suspense",
    "Spirituality",
    "Sports",
    "Thriller",
    "Travel",
    "Young Adult", 
    "Other"]
    
# url_art="https://www.googleapis.com/books/v1/volumes?q=art&orderBy=relevance&maxResults=20&key=#{ENV['GOOGLE_BOOK_API']}"
# url_art="https://www.googleapis.com/books/v1/volumes?q=art&orderBy=relevance&maxResults=20&key=#{ENV['GOOGLE_BOOK_API']}"
url_business="https://www.googleapis.com/books/v1/volumes?q=business&orderBy=relevance&maxResults=2&key=#{ENV['GOOGLE_BOOK_API']}"
# url_fiction="https://www.googleapis.com/books/v1/volumes?q=fiction&orderBy=relevance&maxResults=20&key=#{ENV['GOOGLE_BOOK_API']}"
# url_thriller="https://www.googleapis.com/books/v1/volumes?q=thriller&orderBy=relevance&maxResults=20&key=#{ENV['GOOGLE_BOOK_API']}"
# url_manga="https://www.googleapis.com/books/v1/volumes?q=manga&orderBy=relevance&maxResults=1&key=#{ENV['GOOGLE_BOOK_API']}"
# url_classics="https://www.googleapis.com/books/v1/volumes?q=classics&orderBy=relevance&maxResults=20&key=#{ENV['GOOGLE_BOOK_API']}"
# url_comics="https://www.googleapis.com/books/v1/volumes?q=comics&orderBy=relevance&maxResults=2&key=#{ENV['GOOGLE_BOOK_API']}"

def getApi(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    if response.code == "200"
        result = JSON.parse(response.body)
    end
    book_title = result["items"].map{|item| item["volumeInfo"]["title"]}
    book_description = result["items"].map{|item| item["volumeInfo"]["description"]}
    book_category = result["items"].map{|item| item["volumeInfo"]["categories"]}
    book_average_rating = result["items"].map{|item| item["volumeInfo"]["averageRating"]}
    book_rating_count = result["items"].map{|item| item["volumeInfo"]["ratingsCount"]}
    book_imageLinks = result["items"].map{|item| item["volumeInfo"]["imageLinks"]["thumbnail"]}
    book_author = result["items"].map{|item| item["volumeInfo"]["authors"]}
    # book_snippet =result["items"].map{|item| item["searchInfo"]["textSnippet"]}

    # p book_title.length
    # p book_description.length
    # p book_category.length
    # p book_average_rating.length
    # p book_rating_count.length
    # p book_imageLinks.length
    # p book_author.length
    # p book_snippet.length
    pp result["items"]

end

getApi(url_business)