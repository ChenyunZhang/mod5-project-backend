Post.destroy_all
User.destroy_all
Book.destroy_all

Post.reset_pk_sequence
User.reset_pk_sequence
Book.reset_pk_sequence

require 'net/http'
require 'openssl'
require 'json'
require 'uri'


chenyun = User.create(username: "Chenyun", email:"abc123@abc.com", password: "abc123")

chenyun.avatar.attach(
    io: File.open("./public/test.png"),
    filename: "test.png",
    content_type: "application/png"
)

5.times do
    User.create(
        username: Faker::Name.unique.name,
        email: Faker::Internet.email,
        password: "abc123"
    )
end

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


# url_art="https://www.googleapis.com/books/v1/volumes?q=art&orderBy=relevance&maxResults=40&key=#{ENV['GOOGLE_BOOK_API']}"
# url_business="https://www.googleapis.com/books/v1/volumes?q=business&orderBy=relevance&maxResults=40&key=#{ENV['GOOGLE_BOOK_API']}"
# url_fiction="https://www.googleapis.com/books/v1/volumes?q=fiction&orderBy=relevance&maxResults=40&key=#{ENV['GOOGLE_BOOK_API']}"
# url_thriller="https://www.googleapis.com/books/v1/volumes?q=thriller&orderBy=relevance&maxResults=40&key=#{ENV['GOOGLE_BOOK_API']}"
# url_manga="https://www.googleapis.com/books/v1/volumes?q=manga&orderBy=relevance&maxResults=40&key=#{ENV['GOOGLE_BOOK_API']}"
# url_classics="https://www.googleapis.com/books/v1/volumes?q=classic&orderBy=newest&maxResults=40&key=#{ENV['GOOGLE_BOOK_API']}"
url_comics="https://www.googleapis.com/books/v1/volumes?q=comics&startIndex=0&orderBy=relevance&maxResults=40&key=#{ENV['GOOGLE_BOOK_API']}"

# def getApi(url)
    uri = URI.parse(url_comics)
    response = Net::HTTP.get_response(uri)
    if response.code == "200"
        result = JSON.parse(response.body) 
    end
    book_title = result["items"].map{|item| item["volumeInfo"]["title"]}
    book_description = result["items"].map{|item| item["volumeInfo"]["description"]}
    book_category = result["items"].map{|item| item["volumeInfo"]["categories"]}.flatten
    book_average_rating = result["items"].map{|item| item["volumeInfo"]["averageRating"]}
    book_rating_count = result["items"].map{|item| item["volumeInfo"]["ratingsCount"]}
    book_imageLinks = result["items"].map{|item| item["volumeInfo"]["imageLinks"]["thumbnail"]}
    book_author = result["items"].map{|item| item["volumeInfo"]["authors"]}
    book_snippet =result["items"].map{|item| item["searchInfo"]["textSnippet"]}
# end

    i=0
    while i < 40 do
        Book.create(
            book_average_rating: book_average_rating[i],
            description: book_description[i],
            rating_count:book_rating_count[i],
            imageLink:book_imageLinks[i],
            category:book_category[i],
            title:book_title[i],
            book_author: book_author[i] ? book_author[i][0] : book_author[i],
            book_textsnippet: book_snippet ? book_snippet[i] : ""
        )
        i+=1
    end


5.times do
    Post.create(
        content:Faker::Lorem.paragraph,
        book: Book.all[rand(0..5)],
        user: User.all[rand(0..4)]
    )
end
