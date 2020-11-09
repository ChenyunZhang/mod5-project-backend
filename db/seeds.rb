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

15.times do
    User.create(
        username: Faker::Name.unique.name,
        email: Faker::Internet.email,
        password: "abc123"
    )
end

url_art="https://www.googleapis.com/books/v1/volumes?q=art&orderBy=relevance&maxResults=30&key=#{ENV['GOOGLE_BOOK_API']}"
url_business="https://www.googleapis.com/books/v1/volumes?q=business&orderBy=relevance&maxResults=30&key=#{ENV['GOOGLE_BOOK_API']}"
url_fiction="https://www.googleapis.com/books/v1/volumes?q=fiction&orderBy=relevance&maxResults=40&key=#{ENV['GOOGLE_BOOK_API']}"
url_thriller="https://www.googleapis.com/books/v1/volumes?q=thriller&orderBy=relevance&maxResults=40&key=#{ENV['GOOGLE_BOOK_API']}"
url_manga="https://www.googleapis.com/books/v1/volumes?q=manga&orderBy=relevance&maxResults=30&key=#{ENV['GOOGLE_BOOK_API']}"
url_classics="https://www.googleapis.com/books/v1/volumes?q=classics&orderBy=relevance&maxResults=40&key=#{ENV['GOOGLE_BOOK_API']}"
url_comics="https://www.googleapis.com/books/v1/volumes?q=comics&orderBy=relevance&maxResults=40&key=#{ENV['GOOGLE_BOOK_API']}"

def apifilter(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    if response.code == "200"
        result = JSON.parse(response.body)
    end
    dataArray=[]
    result["items"].select{|item| 
        if item["searchInfo"] && item["searchInfo"]["textSnippet"] != nil
            dataArray.push(item)
        end
        }
    dataArray
end

final = []
final << apifilter(url_art)
final << apifilter(url_business)
final << apifilter(url_fiction)
final << apifilter(url_comics)
final << apifilter(url_manga)
final << apifilter(url_classics)

book_title = final.flatten.map{|book| book["volumeInfo"]["title"]}
book_description = final.flatten.map{|book| book["volumeInfo"]["description"]}
book_category = final.flatten.map{|book| book["volumeInfo"]["categories"]}
book_imageLinks = final.flatten.map{|book| book["volumeInfo"]["imageLinks"]["thumbnail"]}
book_author = final.flatten.map{|book| book["volumeInfo"]["authors"]}
book_snippet =final.flatten.map{|book| book["searchInfo"]["textSnippet"]}

i=0
while i < 50 do
    Book.create(
        description: book_description[i],
        imageLink:book_imageLinks[i],
        category:book_category[i] ? book_category[i][0] : book_category[i],
        title: book_title[i],
        book_author: book_author[i] ? book_author[i][0] : book_author[i],
        book_textsnippet: book_snippet ? book_snippet[i] : ""
    )
    i+=1
end


300.times do
    Post.create(
        content:Faker::Lorem.paragraph,
        book: Book.all[rand(0..200)],
        user: User.all[rand(0..15)]
    )
end
